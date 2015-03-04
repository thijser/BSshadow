#define GLEW_STATIC
#include <GL/glew.h>

#include <SDL.h>
#include <SDL_opengl.h>

#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtc/type_ptr.hpp>

#include <iostream>
#include <cstring>
#include <fstream>
#include <vector>
#include <string>
#include <sstream>
#include <chrono>

const int shadowMapWidth = 4096;
const int shadowMapHeight = 4096;

const int volumeMeshWidth = 768;
const int volumeMeshHeight = 768;

const int windowWidth = 800;
const int windowHeight = 600;

SDL_Window* window;
int vertex_count, volume_vertex_count;

glm::mat4 shadowTrans, trans;
glm::vec3 lightPos, eyePos;

GLuint programShadow, programCam, programVolume, programScreen;
GLuint fboShadow, fboScene, fboVolume;
GLint uniMVP, uniShadowMVP, uniInvShadowMVP;
GLint uniLightPos, uniEyePos;
GLuint texShadowDepthBuf, texSceneDepthBuf, texSceneColorBuf, texVolumeColorBuf;
GLuint vaoScene, vaoVolume, vaoScreenQuad;

auto t_start = std::chrono::high_resolution_clock::now();

// Debug callback
void APIENTRY debugMessage(GLenum source, GLenum type, GLuint id, GLenum severity, GLsizei length, const GLchar* message, const void* userParam) {
	if (id != 131185 && id != 131218) {
		std::cout << message << std::endl;
	}
}

// Set up window and context
void create_opengl_context() {
	SDL_Init(SDL_INIT_VIDEO);

	SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_CORE);
	SDL_GL_SetAttribute(SDL_GL_CONTEXT_FLAGS, SDL_GL_CONTEXT_DEBUG_FLAG);
	SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 4);
	SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 4);

	SDL_GL_SetAttribute(SDL_GL_MULTISAMPLEBUFFERS, 1);
	SDL_GL_SetAttribute(SDL_GL_MULTISAMPLESAMPLES, 4);

	window = SDL_CreateWindow("Volumetric shadows", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, windowWidth, windowHeight, SDL_WINDOW_OPENGL);
	SDL_GLContext context = SDL_GL_CreateContext(window);

	glewExperimental = true;
	glewInit();

	glEnable(GL_DEBUG_OUTPUT);
	glEnable(GL_DEBUG_OUTPUT_SYNCHRONOUS);
	glDebugMessageCallback(debugMessage, nullptr);
	glDebugMessageControl(GL_DONT_CARE, GL_DONT_CARE, GL_DONT_CARE, 0, nullptr, GL_TRUE);

	glEnable(GL_DEPTH_TEST);
}

// Load text file
std::string loadFile(const std::string& filename) {
	std::ifstream file(filename, std::ios::ate);
	if (!file.is_open()) throw std::invalid_argument("can't open file");

	size_t length = file.tellg();
	file.seekg(std::ios::beg, 0);

	std::vector<char> buffer(length + 1);
	file.read(&buffer[0], length);
	buffer[length] = 0;

	return &buffer[0];
}

// Split string by char
std::vector<std::string> split(const std::string& s, char delim) {
	std::stringstream ss(s);
	std::string item;
	std::vector<std::string> elems;

	while (std::getline(ss, item, delim)) {
		elems.push_back(item);
	}

	return elems;
}

// Load vertices from .obj model
std::vector<float> loadOBJ(const std::string& filename, int& vertex_count) {
	auto lines = split(loadFile(filename), '\n');

	// Parse vertices and faces
	std::vector<glm::vec3> positions;
	std::vector<glm::vec3> normals;
	std::vector<glm::ivec3> triangle_positions;
	std::vector<glm::ivec3> triangle_normals;

	for (const std::string& line : lines) {
		if (line[0] == 'v' && line[1] != 'n') {
			glm::vec3 vec;
			sscanf_s(line.c_str(), "v %f %f %f", &vec.x, &vec.y, &vec.z);
			positions.push_back(vec);
		} else if (line[0] == 'v' && line[1] == 'n') {
			glm::vec3 norm;
			sscanf_s(line.c_str(), "vn %f %f %f", &norm.x, &norm.y, &norm.z);
			normals.push_back(norm);
		} else if (line[0] == 'f') {
			glm::ivec3 pos_idx, norm_idx;
			sscanf_s(line.c_str(), "f %d//%d %d//%d %d//%d", &pos_idx.x, &norm_idx.x, &pos_idx.y, &norm_idx.y, &pos_idx.z, &norm_idx.z);
			triangle_positions.push_back(pos_idx);
			triangle_normals.push_back(norm_idx);
		}
	}

	// Turn faces into buffer with vertices
	std::vector<float> buffer;
	buffer.reserve(triangle_positions.size() * 6);

	for (int i = 0; i < triangle_positions.size(); i++) {
		glm::ivec3 pos_idx = triangle_positions[i], norm_idx = triangle_normals[i];

		for (int j = 0; j < 3; j++) {
			buffer.push_back(positions[pos_idx[j] - 1].x);
			buffer.push_back(positions[pos_idx[j] - 1].y);
			buffer.push_back(positions[pos_idx[j] - 1].z);

			buffer.push_back(normals[norm_idx[j] - 1].x);
			buffer.push_back(normals[norm_idx[j] - 1].y);
			buffer.push_back(normals[norm_idx[j] - 1].z);
		}
	}

	vertex_count = (int) triangle_positions.size() * 3;

	return buffer;
}

GLuint createShader(GLenum type, const std::string src) {
	GLuint obj = glCreateShader(type);

	const char* srcPtr = src.c_str();
	int len = (int) strlen(srcPtr);
	glShaderSource(obj, 1, &srcPtr, &len);
	glCompileShader(obj);

	return obj;
}

GLuint createProgram(GLuint vertexShader, GLuint fragmentShader) {
	GLuint obj = glCreateProgram();

	glAttachShader(obj, vertexShader);
	glAttachShader(obj, fragmentShader);
	glBindFragDataLocation(obj, 0, "outColor");
	glLinkProgram(obj);
	glUseProgram(obj);

	return obj;
}

void setup_shaders() {
	// Load scene (positions + normals), volume and screenspace vertex shaders
	GLuint vShaderScene = createShader(GL_VERTEX_SHADER, loadFile("shaders/scene.vert"));
	GLuint vShaderVolume = createShader(GL_VERTEX_SHADER, loadFile("shaders/volume.vert"));
	GLuint vShaderScreen = createShader(GL_VERTEX_SHADER, loadFile("shaders/screen.vert"));

	// Load fragment shaders for shadow mapping pass, camera pass, volume pass and screenspace pass
	GLuint fShaderShadow = createShader(GL_FRAGMENT_SHADER, loadFile("shaders/minimal.frag"));
	GLuint fShaderCam = createShader(GL_FRAGMENT_SHADER, loadFile("shaders/lighting.frag"));
	GLuint fShaderVolume = createShader(GL_FRAGMENT_SHADER, loadFile("shaders/volume.frag"));
	GLuint fShaderScreen = createShader(GL_FRAGMENT_SHADER, loadFile("shaders/screen.frag"));

	// Compile program for shadow mapping pass
	programShadow = createProgram(vShaderScene, fShaderShadow);

	// Compile program for camera pass
	programCam = createProgram(vShaderScene, fShaderCam);
	
	glUniform1i(glGetUniformLocation(programCam, "texShadowDepth"), 0);

	// Compile program for volume pass
	programVolume = createProgram(vShaderVolume, fShaderVolume);

	glUniform1i(glGetUniformLocation(programVolume, "texShadowDepth"), 0);
	glUniform1i(glGetUniformLocation(programVolume, "texSceneDepth"), 1);

	glUniform1f(glGetUniformLocation(programVolume, "screenWidth"), (float) windowWidth);
	glUniform1f(glGetUniformLocation(programVolume, "screenHeight"), (float) windowHeight);

	// Compile program for screenspace pass
	programScreen = createProgram(vShaderScreen, fShaderScreen);

	glUniform1i(glGetUniformLocation(programScreen, "texSceneColor"), 0);
	glUniform1i(glGetUniformLocation(programScreen, "texVolumeColor"), 1);

	uniMVP = glGetUniformLocation(programCam, "mvp");
	uniShadowMVP = glGetUniformLocation(programCam, "shadowMVP");
	uniLightPos = glGetUniformLocation(programCam, "lightPos");
	uniInvShadowMVP = glGetUniformLocation(programVolume, "invShadowMVP");
	uniEyePos = glGetUniformLocation(programVolume, "eyePos");
}

void setup_scene_geometry() {
	glGenVertexArrays(1, &vaoScene);
	glBindVertexArray(vaoScene);

	// Load vertex data
	auto vertices = loadOBJ("meshes/seminarium.obj", vertex_count);

	GLuint vbo;
	glGenBuffers(1, &vbo);
	glBindBuffer(GL_ARRAY_BUFFER, vbo);
	glBufferData(GL_ARRAY_BUFFER, vertices.size() * sizeof(float), &vertices[0], GL_STATIC_DRAW);

	GLint posAttrib = glGetAttribLocation(programCam, "pos");
	glVertexAttribPointer(posAttrib, 3, GL_FLOAT, GL_FALSE, sizeof(float) * 6, 0);
	glEnableVertexAttribArray(posAttrib);

	GLint normAttrib = glGetAttribLocation(programCam, "norm");
	glVertexAttribPointer(normAttrib, 3, GL_FLOAT, GL_FALSE, sizeof(float) * 6, (void*) (sizeof(float) * 3));
	glEnableVertexAttribArray(normAttrib);
}

void setup_volume_geometry() {
	glGenVertexArrays(1, &vaoVolume);
	glBindVertexArray(vaoVolume);

	// Create mesh with base plane and 4 faces to close mesh as pyramid as seen in paper
	// Each vertex has a u, v coordinate in the shadow map and a float for the depth scale
	// The depth is used to position the top vertices at the near plane to form a pyramid
	std::vector<float> vertices;

	for (int i = 0; i < volumeMeshWidth; i++) {
		for (int j = 0; j < volumeMeshWidth; j++) {
			float u = i / (float) volumeMeshWidth;
			float v = j / (float) volumeMeshHeight;

			float du = 1.0f / volumeMeshWidth;
			float dv = 1.0f / volumeMeshHeight;

			float face[] = {
				u + du, v + dv, 1,
				u + du, v, 1,
				u, v, 1,

				u, v, 1,
				u, v + dv, 1,
				u + du, v + dv, 1,
			};

			vertices.insert(vertices.end(), face, face + 6 * 6);
		}
	}

	float mesh[] = {
		0.0f, 0.0f, 1,
		1.0f, 0.0f, 1,
		0.5f, 0.5f, 0,

		0.0f, 1.0f, 1,
		1.0f, 1.0f, 1,
		0.5f, 0.5f, 0,

		1.0f, 0.0f, 1,
		1.0f, 1.0f, 1,
		0.5f, 0.5f, 0,

		0.0f, 0.0f, 1,
		0.0f, 1.0f, 1,
		0.5f, 0.5f, 0,
	};

	vertices.insert(vertices.end(), mesh, mesh + sizeof(mesh) / sizeof(float));

	volume_vertex_count = (int) vertices.size() / 3;

	GLuint vbo;
	glGenBuffers(1, &vbo);
	glBindBuffer(GL_ARRAY_BUFFER, vbo);
	glBufferData(GL_ARRAY_BUFFER, vertices.size() * sizeof(float), &vertices[0], GL_STATIC_DRAW);

	GLint coordsAttrib = glGetAttribLocation(programVolume, "coords");
	glVertexAttribPointer(coordsAttrib, 2, GL_FLOAT, GL_FALSE, sizeof(float) * 3, 0);
	glEnableVertexAttribArray(coordsAttrib);

	GLint depthScaleAttrib = glGetAttribLocation(programVolume, "depthScale");
	glVertexAttribPointer(depthScaleAttrib, 1, GL_FLOAT, GL_FALSE, sizeof(float) * 3, (void*) (sizeof(float) * 2));
	glEnableVertexAttribArray(depthScaleAttrib);
}

void setup_screenquad_geometry() {
	glGenVertexArrays(1, &vaoScreenQuad);
	glBindVertexArray(vaoScreenQuad);

	float vertices[] = {
		1.0f, -1.0f, 1.0f, 0.0f,
		1.0f, 1.0f, 1.0f, 1.0f,
		-1.0f, 1.0f, 0.0f, 1.0f,

		-1.0f, 1.0f, 0.0f, 1.0f,
		-1.0f, -1.0f, 0.0f, 0.0f,
		1.0f, -1.0f, 1.0f, 0.0f,
	};

	GLuint vbo;
	glGenBuffers(1, &vbo);
	glBindBuffer(GL_ARRAY_BUFFER, vbo);
	glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);

	GLint posAttrib = glGetAttribLocation(programScreen, "pos");
	glVertexAttribPointer(posAttrib, 2, GL_FLOAT, GL_FALSE, sizeof(float) * 4, 0);
	glEnableVertexAttribArray(posAttrib);

	GLint coordsAttrib = glGetAttribLocation(programScreen, "coords");
	glVertexAttribPointer(coordsAttrib, 2, GL_FLOAT, GL_FALSE, sizeof(float) * 4, (void*) (sizeof(float) * 2));
	glEnableVertexAttribArray(coordsAttrib);
}

GLuint createTexture(GLint internalFormat, GLint format, GLsizei width, GLsizei height) {
	GLuint obj;
	glGenTextures(1, &obj);

	glBindTexture(GL_TEXTURE_2D, obj);
	glTexImage2D(GL_TEXTURE_2D, 0, internalFormat, width, height, 0, format, GL_FLOAT, nullptr);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);

	return obj;
}

void setup_framebuffer() {
	// Create framebuffer to hold shadow map
	glGenFramebuffers(1, &fboShadow);
	glBindFramebuffer(GL_FRAMEBUFFER, fboShadow);

	texShadowDepthBuf = createTexture(GL_DEPTH_COMPONENT, GL_DEPTH_COMPONENT, shadowMapWidth, shadowMapHeight);

	glFramebufferTexture2D(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_TEXTURE_2D, texShadowDepthBuf, 0);

	// Create framebuffer to hold scene
	glGenFramebuffers(1, &fboScene);
	glBindFramebuffer(GL_FRAMEBUFFER, fboScene);

	texSceneColorBuf = createTexture(GL_RGBA, GL_RGBA, windowWidth, windowHeight);
	texSceneDepthBuf = createTexture(GL_DEPTH_COMPONENT, GL_DEPTH_COMPONENT, windowWidth, windowHeight);

	glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, texSceneColorBuf, 0);
	glFramebufferTexture2D(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_TEXTURE_2D, texSceneDepthBuf, 0);

	// Create framebuffer to hold volume with high-precision color buffer (only one channel needed for lightness)
	glGenFramebuffers(1, &fboVolume);
	glBindFramebuffer(GL_FRAMEBUFFER, fboVolume);

	texVolumeColorBuf = createTexture(GL_R32F, GL_RED, windowWidth, windowHeight);

	glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, texVolumeColorBuf, 0);
}

void setup() {
	setup_shaders();

	setup_scene_geometry();
	setup_volume_geometry();
	setup_screenquad_geometry();

	setup_framebuffer();
}

// Pass 1: Draw the scene from the light's point of view to the shadow map
void render_shadow_map() {
	glBindFramebuffer(GL_FRAMEBUFFER, fboShadow);

	glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	glUseProgram(programShadow);
	glBindVertexArray(vaoScene);

	auto t = std::chrono::duration_cast<std::chrono::duration<float>>(std::chrono::high_resolution_clock::now() - t_start).count();
	float j = sin(t * 2) / 2 + 3.4f;

	glViewport(0, 0, shadowMapWidth, shadowMapHeight);

	lightPos = glm::vec3(15.0f, 8.0f, 2 + 10.0f * sin(j));
	glm::mat4 proj = glm::perspective(glm::radians(70.0f), windowWidth / (float) windowHeight, 0.1f, 100.0f);
	glm::mat4 view = glm::lookAt(lightPos, glm::vec3(0.0f, 0.0f, 0.0f), glm::vec3(0.0f, 1.0f, 0.0f));
	shadowTrans = proj * view;

	glUniformMatrix4fv(uniMVP, 1, GL_FALSE, glm::value_ptr(shadowTrans));

	glEnable(GL_CULL_FACE);
	glCullFace(GL_FRONT);

	glDrawArrays(GL_TRIANGLES, 0, vertex_count);

	glCullFace(GL_BACK);

	glViewport(0, 0, windowWidth, windowHeight);
}

// Pass 2: Draw the scene from the camera and sample the shadow map to draw shadows
void render_camera() {
	glBindFramebuffer(GL_FRAMEBUFFER, fboScene);

	glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	glUseProgram(programCam);
	glBindVertexArray(vaoScene);

	glActiveTexture(GL_TEXTURE0);
	glBindTexture(GL_TEXTURE_2D, texShadowDepthBuf);

	eyePos = glm::vec3(-3.0f, 2.0f, 0.0f);
	glm::mat4 proj = glm::perspective(glm::radians(70.0f), windowWidth / (float) windowHeight, 0.1f, 100.0f);
	glm::mat4 view = glm::lookAt(eyePos, glm::vec3(5.0f, 2.0f, 0.0f), glm::vec3(0.0f, 1.0f, 0.0f));
	trans = proj * view;

	glUniformMatrix4fv(uniMVP, 1, GL_FALSE, glm::value_ptr(trans));
	glUniformMatrix4fv(uniShadowMVP, 1, GL_FALSE, glm::value_ptr(shadowTrans));
	glUniform3fv(uniLightPos, 1, glm::value_ptr(lightPos));

	glDrawArrays(GL_TRIANGLES, 0, vertex_count);
}

// Pass 3: Draw the volume using the shadow map
void render_volume() {
	glBindFramebuffer(GL_FRAMEBUFFER, fboVolume);

	glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
	glClear(GL_COLOR_BUFFER_BIT);

	glUseProgram(programVolume);
	glBindVertexArray(vaoVolume);

	glActiveTexture(GL_TEXTURE0);
	glBindTexture(GL_TEXTURE_2D, texShadowDepthBuf);

	glActiveTexture(GL_TEXTURE1);
	glBindTexture(GL_TEXTURE_2D, texSceneDepthBuf);

	glUniformMatrix4fv(uniMVP, 1, GL_FALSE, glm::value_ptr(trans));
	glUniformMatrix4fv(uniInvShadowMVP, 1, GL_FALSE, glm::value_ptr(glm::inverse(shadowTrans)));
	glUniform3fv(uniEyePos, 1, glm::value_ptr(eyePos));

	glDisable(GL_DEPTH_TEST);

	glEnable(GL_BLEND);
	glBlendFunc(GL_ONE, GL_ONE);

		glBlendEquation(GL_FUNC_ADD);
		glCullFace(GL_FRONT);

		glDrawArrays(GL_TRIANGLES, 0, volume_vertex_count);

		glBlendEquation(GL_FUNC_REVERSE_SUBTRACT);
		glCullFace(GL_BACK);

		glDrawArrays(GL_TRIANGLES, 0, volume_vertex_count);

	glDisable(GL_BLEND);

	glEnable(GL_DEPTH_TEST);
}

// Pass 4: Combine the scene and the volume lighting
void render_screen() {
	glBindFramebuffer(GL_FRAMEBUFFER, 0);

	glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
	glClear(GL_COLOR_BUFFER_BIT);

	glUseProgram(programScreen);
	glBindVertexArray(vaoScreenQuad);

	glActiveTexture(GL_TEXTURE0);
	glBindTexture(GL_TEXTURE_2D, texSceneColorBuf);

	glActiveTexture(GL_TEXTURE1);
	glBindTexture(GL_TEXTURE_2D, texVolumeColorBuf);

	glDisable(GL_DEPTH_TEST);

	glDrawArrays(GL_TRIANGLES, 0, 6);

	glEnable(GL_DEPTH_TEST);
}

void main_loop() {
	SDL_Event windowEvent;
	while (true) {
		if (SDL_PollEvent(&windowEvent)) {
			if (windowEvent.type == SDL_QUIT) break;
			if (windowEvent.type == SDL_KEYDOWN && windowEvent.key.keysym.sym == SDLK_ESCAPE) break;
		}

		render_shadow_map();
		render_camera();
		render_volume();
		render_screen();

		SDL_GL_SwapWindow(window);
	}
}

int main(int argc, char *argv[]) {
	create_opengl_context();

	setup();

	main_loop();

	SDL_Quit();

	return 0;
}