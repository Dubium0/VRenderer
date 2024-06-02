#version 450

layout(binding = 0) uniform UniformBufferObject {
    mat4 model;
    mat4 view;
    mat4 proj;
} ubo;


layout(location = 0) in vec3 inPosition;
layout(location = 1) in vec3 inNormal;
layout(location = 2) in vec2 inTexCoord;

layout(location = 0) out vec3 fragPos;
layout(location = 1) out vec3 Normal;
layout(location = 2) out vec3 LightPos;
layout(location = 3) out vec2 TexCoords;


void main() {
    gl_Position = ubo.proj * ubo.view * ubo.model * vec4(inPosition, 1.0);
    fragPos = vec3(ubo.view*ubo.model* vec4(inPosition, 1.0));
    Normal = mat3(transpose(inverse(ubo.view*ubo.model))) * inNormal;
    LightPos = vec3(ubo.view * vec4(vec3(1.0,0.0,0.0), 1.0));
    TexCoords = inTexCoord;

}