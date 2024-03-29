#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;


uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewProjectionMatrixInverse;
uniform vec3 boundingBoxMin;

const vec4 BLACK=vec4(0, 0, 0, 1);

void main( void )
{
	// Els triangles normals
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		gl_Position = gl_in[i].gl_Position;
		EmitVertex();
	}
    	EndPrimitive();

	for( int i = 0; i < 3; i++ ){
		gfrontColor = BLACK;
		vec4 V = modelViewProjectionMatrixInverse*gl_in[i].gl_Position; // PASEM DE CLIP SPACE A EYE SPACE
		V.y = boundingBoxMin.y;
		gl_Position = modelViewProjectionMatrix*V;
		EmitVertex();
	}
	EndPrimitive();
}
