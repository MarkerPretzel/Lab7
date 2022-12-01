#version 330

uniform sampler2D myTexture;
uniform mat4 myProjectionMatrix;
uniform mat4 myModelviewMatrix;
uniform vec3 lightPos;

//TODO: pass in the needed variables
in vec3 myNormal;
in vec4 myPosition;

out vec3 mynormal;
out vec2 texCoord;
//TODO: pass out the needed variables

void main() {
	//TODO: modify this code to make the object appear!
	mynormal = myNormal;
	gl_Position = myProjectionMatrix * myModelviewMatrix * myPosition;
	
	float theta = .5f + atan(myPosition.x, myPosition.z);
	float rawU = theta / (2.0f * 3.14159265358979323846264338327950288419716939937510);
	float u = 1 - (rawU + 0.5);
	float v = myPosition[1];
	texCoord = vec2(u, v);
	
}

