#version 330 core
precision highp float;

uniform int max_iterations;
uniform vec2 screen_size;
uniform vec2 zoom;
uniform vec2 offset;

vec2 squareImaginary(vec2 num){
    return vec2(num.x*num.x - num.y*num.y, 2 * num.x * num.y);
}

float mandelbrotValue(vec2 coord){
    vec2 z = vec2(0.0, 0.0);
    for(int i = 0; i < max_iterations; i++){
        z = squareImaginary(z) + coord;
        if(length(z) > 2){
            return float(i)/(max_iterations);
        }
    }
    return float(max_iterations);

}

void main(){
    vec2 normalized_pixel_coords = vec2(gl_FragCoord.x/screen_size.x, gl_FragCoord.y/screen_size.y) * zoom - offset;
    vec3 outputColor = vec3(mandelbrotValue(normalized_pixel_coords));
    gl_FragColor = vec4(outputColor, 1.0);
}
