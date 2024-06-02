#version 450

layout(location = 0) out vec4 outColor;

layout(location = 0) in vec3 fragPos;
layout(location = 1) in vec3 Normal;
layout(location = 2) in vec3 LightPos;
layout(location = 3) in vec2 TexCoords;


layout(binding = 1) uniform sampler2D texSampler;



void main() {
     // ambient light
 
    vec3 ambient = vec3(.1,.1,.1) * vec3( texture(texSampler,TexCoords));
    
    
    // diffuse light
    vec3 norm = normalize(Normal);
    vec3 lightDirection = normalize(LightPos-fragPos);
    float diff = max(dot(norm,lightDirection),0.0);
    vec3 diffuse = diff * vec3(.8) * vec3( texture(texSampler,TexCoords));
   
  
   

    vec3 result = ambient  + diffuse;
    outColor = vec4(result,1.0);

}