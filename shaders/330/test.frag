#version 330

uniform sampler2D myTexture;
uniform mat4 myProjectionMatrix;
uniform mat4 myModelviewMatrix;
uniform vec3 lightPos;

//TODO: pass in the needed variables
in vec3 mynormal;
in vec2 texCoord;

out vec4 outputColor; //this tells OpenGL that this variable is the output color
void main()
{
	//TODO: goal is to set outputColor to the right info
	vec4 light = 0.5 * vec4(1.0, 1.0, 1.0, 1.0);
	float diffuse = dot(normalize(mynormal), normalize(vec3(1.0,1.0,1.0)));
	vec4 mytex = texture(myTexture, texCoord);
	outputColor = diffuse * vec4(mytex.x, mytex.y, mytex.z, 1.0);
	//outputColor = vec4(rotateLightPos, 1.0);
	// outputColor = vec4(1.0, 1.0, 1.0, 1.0);
	// float theta = .5 + atan2(ist_min.x, ist_min.z);
	// float rawU = theta / (2.0f * PI);
	// float u = my_ppm->getWidth()-(1 - (rawU + 0.5));
	// float v = fmod(.5 + ist_min[1], 1);
	// float s = fmod((u*(float)my_ppm->getWidth()*texture->repeatU), (float)my_ppm->getWidth());
	// float t = fmod((v*(float)my_ppm->getHeight()*texture->repeatV), (float)my_ppm->getHeight());
	// SceneColor tex_c = my_ppm->getPixel(s, my_ppm->getHeight()-t);
	// texture(textureName, texCoord) ;
}