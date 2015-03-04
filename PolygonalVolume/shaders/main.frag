#version 440

uniform sampler2D texShadowDepth;
uniform mat4 shadowMVP;
uniform vec3 lightPos;

in vec3 Norm;
in vec3 Pos;

out vec4 outColor;

void main() {
    vec4 coords = shadowMVP * vec4(Pos, 1.0);
    coords /= coords.w;

    coords.x = (coords.x + 1.0) / 2.0;
    coords.y = (coords.y + 1.0) / 2.0;
    coords.z = (coords.z + 1.0) / 2.0;

    float shadowDepth = texture(texShadowDepth, coords.xy).x;
    float depth = coords.z;

    float diffuse = max(0.0, dot(normalize(lightPos - Pos), Norm));
    float ambient = 0.4;

    if (depth < shadowDepth) {
        outColor = vec4(abs(Norm) * (diffuse + ambient), 1.0);
    } else {
        outColor = vec4(abs(Norm) * ambient, 1.0);
    }
}