#version 440

in vec3 Norm;
in vec3 Pos;

out vec4 outColor;

void main() {
    outColor = vec4(abs(Norm), 1.0);
}