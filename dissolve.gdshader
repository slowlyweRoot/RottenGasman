shader_type canvas_item;

uniform float value :hint_range(0,1);
uniform sampler2D noise_texture:repeat_enable;


void fragment() {
	
	vec2 uv = vec2(UV.x+sin(TIME*0.05), UV.y+sin(TIME*0.05));
	
	vec4 current_pixel=texture(TEXTURE,UV);
	vec4 noise_pixel= texture(noise_texture,uv);
	
	if(noise_pixel.r > value){
		COLOR.a-=0.20f+sin(TIME*3.)/5.;
		
	}
	else{
		COLOR = current_pixel;
	}
}

