#version 330 core
layout (location = 0) in vec3 vboPos;

void main(){
    gl_Position = vec4(vboPos, 1.0);
}
