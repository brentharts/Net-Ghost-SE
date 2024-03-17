#version 330 core

// Final color of pixel
out vec4 FragmentColor;

// Imports the current position we calculated
in vec3 crntPos;

// Imports the normal from the Vertex Shader
in vec3 Normal;

// Imports the texture coordinates from the Vertex Shader
in vec2 texCoord;

// light uniforms
uniform vec4 lightColor;
uniform vec3 lightPos;

// Mesh uniform
uniform vec3 camPos;

// Textures
uniform sampler2D diffuse0;
uniform sampler2D specular0;

vec4 pointLight()
{
	vec3 normal = normalize(Normal);
	vec3 lightDirection = normalize(lightPos - crntPos);

	float ambient = 0.3f;

	float diffuse = max(dot(normal, lightDirection), 0.0f);

	return (diffuse + ambient) * lightColor * vec4(0.5f,0.5f,0.5f,1.0f);
}

vec4 direcLight()
{
	// ambient lighting
	float ambient = 0.20f;

	// diffuse lighting
	vec3 normal = normalize(Normal);
	vec3 lightDirection = -normalize(vec3(-1.0f, -10.0f, 10.0f));
	float diffuse = max(dot(normal, lightDirection), 0.0f);

	return (diffuse + ambient) * lightColor;
}


void main()
{
	FragmentColor = pointLight() + direcLight();
}