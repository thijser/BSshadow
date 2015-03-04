#version 440

layout(location = 0) uniform mat4 mvp;

in vec3 pos;
in vec3 norm;

out vec3 Norm;
out vec3 Pos;

void main() {
    Norm = norm;
    Pos = pos;
    gl_Position = mvp * vec4(pos, 1.0);
}