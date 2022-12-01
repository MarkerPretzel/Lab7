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
	
	float theta = .5 + atan2(gl_Position.x, gl_Position.z);
	float rawU = theta / (2.0f * 3.14159265358979323846264338327950288419716939937510);
	float u = 1 - (rawU + 0.5);
	float v = fmod(.5 + gl_Position[1], 1);

	
}

