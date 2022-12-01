#version 330

uniform sampler2D myTexture;
uniform mat4 myProjectionMatrix;
uniform mat4 myModelviewMatrix;
uniform vec3 lightPos;

//TODO: pass in the needed variables
in vec4 myNormal;
in vec4 myPosition;

out vec4 myNormalOut;
//TODO: pass out the needed variables

void main() {
	//TODO: modify this code to make the object appear!
	myNormalOut = myNormal;
	gl_Position = myProjectionMatrix * myModelviewMatrix * myPosition;
}

