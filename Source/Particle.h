#ifndef PARTICLE_H
#define PARTICLE_H

#include "Camera.h"
#include "Texture.h"
#include "glm/glm.hpp"
#include <vector>
#include <math.h>

class Particle {
	public:
		Particle();

		void Draw(Shader& shader, Camera& camera);

		void update(float delta);

		float expire = 3.0f;
		float life = 0.0f;
		float lift = 0.002f;
		glm::vec3 vel = glm::vec3(1.f,0.f,0.f);

		glm::vec3 getTranslation();
		void setTranslation(glm::vec3 translation);
		void setScale(glm::vec3 scale);

	private:
		static std::vector <float> Vert;
		static std::vector <GLuint> Ind;
		static GLuint VAO, VBO, EBO;

		static Texture* sprite;

		void setRotation(glm::quat rotation);

		glm::vec3 translation = glm::vec3(0.0f, 0.0f, 0.0f);
		glm::quat rotation = glm::quat(1.0f, 0.0f, 0.0f, 0.0f);
		glm::vec3 scale = glm::vec3(1.0f, 1.0f, 1.0f);
};

#endif