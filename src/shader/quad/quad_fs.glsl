#version 330 core
out vec4 FragColor;

in vec2 TexCoords;

uniform sampler2D texture1;

void main(){
    FragColor = vec4(vec3(texture(texture1,TexCoords).r),1.0);
    //FragColor = vec4(1.0,1.0,0.0,1.0);
}
