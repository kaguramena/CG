#version 330 core

out vec4 FragColor;

in VS_OUT {
    vec3 FragPos;
    vec3 Normal;
    vec2 TexCoords;
} fs_in;

uniform sampler2D texture1;
uniform vec3 lightPos;
uniform vec3 viewPos;
uniform bool blinn;

void main(){
    vec3 color = texture(texture1,fs_in.TexCoords).rgb; // get color
    vec3 ambient = 0.05 * color;

    vec3 LightDir = normalize(lightPos - fs_in.FragPos);
    vec3 Normal = normalize(fs_in.Normal);
    float diff = max(dot(LightDir,fs_in.Normal),0.0);
    vec3 diffuse = diff * color;

    vec3 reflectDir = reflect(-LightDir,Normal);
    vec3 ViewDir = normalize(viewPos - fs_in.FragPos);
    float spec = 0.0;
    if(blinn){
        vec3 halfwayDir = normalize((LightDir + ViewDir)/2);
        spec = pow(max(dot(Normal, halfwayDir), 0.0), 32.0);
    }else{
        spec = pow(max(dot(reflectDir,ViewDir),0.0),8.0);
    }
    vec3 specular = spec * vec3(0.3);
    FragColor = vec4(ambient + diffuse + specular,1.0);
}