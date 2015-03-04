#version 440

layout(location = 0) uniform mat4 mvp;

uniform sampler2D texShadowDepth;
uniform mat4 invShadowMVP;

in vec2 coords;
in float depthScale;

out vec3 Norm;
out vec3 Pos;

const float bias = 0.0001;

void main() {
    Norm = vec3(coords, 1.0);

    float depth = texture(texShadowDepth, coords).x;

    vec4 devCoords = vec4(
        coords.x * 2.0 - 1.0,
        coords.y * 2.0 - 1.0,
        (depth - bias) * depthScale * 2.0 - 1.0,
        1.0
    );

    vec4 p = invShadowMVP * devCoords;
    gl_Position = mvp * p;

    Pos = p.xyz;
}