#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform float time;
uniform float speed;

void main()
{
	
    vec3 N = normalize(normalMatrix * normal);
    frontColor  = vec4(color,1.0);
	
    float rotation = time*speed;
    mat3 rot_mat = mat3(vec3(cos(rotation), 0, -sin(rotation)), vec3(0,1,0), vec3(sin(rotation), 0, cos(rotation)));
    vec3 vert = rot_mat*vertex;
    gl_Position = modelViewProjectionMatrix * vec4(vert, 1.0);
}
