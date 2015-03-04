#version 440

uniform sampler2D texSceneColor;
uniform sampler2D texVolumeColor;

in vec2 Coords;

out vec4 outColor;

void main() {
    vec3 sceneComponent = texture(texSceneColor, Coords).rgb;
    vec3 volumeComponent = max(0, texture(texVolumeColor, Coords).r) * vec3(1, 1, 1);
    
    outColor = vec4(sceneComponent + volumeComponent * 1000.0, 1);
}