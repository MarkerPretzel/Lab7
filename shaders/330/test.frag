#version 330

uniform sampler2D myTexture;
uniform mat4 myProjectionMatrix;
uniform mat4 myModelviewMatrix;
uniform vec3 lightPos;
uniform float useNormalMap;

in vec3 mynorm;
in vec2 texCoord;
in vec2 normalmap;
in vec3 geo_norm;

out vec4 outputColor; //this tells OpenGL that this variable is the output color
void main()
{
	//TODO: goal is to set outputColor to the right info
	vec4 light = 0.5 * vec4(1.0, 1.0, 1.0, 1.0);
	float diffuse = dot(normalize(mynorm), normalize(vec3(1.0,1.0,1.0)));
	if(useNormalMap >= .5){
		diffuse = diffuse * dot(normalize(geo_norm), normalize(vec3(1.0,1.0,1.0)));
	}
	vec4 mytex = texture(myTexture, texCoord);
	outputColor = diffuse * vec4(mytex.x, mytex.y, mytex.z, 1.0);
	//outputColor = vec4(rotateLightPos, 1.0);
	// outputColor = vec4(1.0, 1.0, 1.0, 1.0);
}