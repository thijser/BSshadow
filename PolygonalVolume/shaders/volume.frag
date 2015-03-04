#version 440

uniform float screenWidth, screenHeight;

uniform vec3 eyePos;
uniform sampler2D texSceneDepth;

in vec3 Norm;
in vec3 Pos;

out vec4 outColor;

void main() {
    // Discard fragment if behind scene
    // TODO: Clip distance instead
    float sceneDepth = texture(texSceneDepth, vec2(gl_FragCoord.x / screenWidth, gl_FragCoord.y / screenHeight)).r;
    if (gl_FragCoord.z > sceneDepth) discard;

    float d = distance(eyePos, Pos);
    float L = d / 100.0;

    outColor = vec4(L, 0, 0, 0);
}