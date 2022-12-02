#version 330

uniform sampler2D myTexture;
uniform sampler2D myNormalMap;
uniform mat4 myProjectionMatrix;
uniform mat4 myModelviewMatrix;
uniform vec3 lightPos;
uniform float useNormalMap;

//TODO: pass in the needed variables
in vec3 myNormal;
in vec4 myPosition;

out vec3 mynorm;
out vec3 geo_norm;
out vec2 texCoord;
out float normalmap;
//TODO: pass out the needed variables

void main() {
	//TODO: modify this code to make the object appear!
	geo_norm = myNormal;
	normalmap = useNormalMap;
	gl_Position = myProjectionMatrix * myModelviewMatrix * myPosition;
	mynorm = myNormal;
	float theta = .5f + atan(myPosition.x, myPosition.z);
	float rawU = theta / (2.0f * 3.14159265358979323846264338327950288419716939937510);
	float u = 1 - (rawU + 0.5);
	float v = myPosition[1];
	texCoord = vec2(u*2.0f, v*2.0f);
	// if normal mapping is turned on change my normal
	if(useNormalMap >= .5){
		vec3 mynorm_pos = vec3(texture(myNormalMap, texCoord));
		float OldRange = (1 - 0);
		float NewRange = (1 + 1);
		mynorm = vec3(((mynorm_pos[0]* NewRange) / OldRange) - 1, ((mynorm_pos[1]* NewRange) / OldRange) - 1, ((mynorm_pos[2]* NewRange) / OldRange) - 1);
	}
	
}

