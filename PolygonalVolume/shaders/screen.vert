#version 440

in vec2 pos;
in vec2 coords;

out vec2 Coords;

void main() {
    Coords = coords;
    gl_Position = vec4(pos, 0.0, 1.0);
}