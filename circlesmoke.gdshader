shader_type canvas_item;
uniform sampler2D noise_img:repeat_enable ;
uniform float speed = 1.0;
uniform vec4 smoke_color:source_color;


void fragment() {
	vec2 uv1 =vec2(UV.x +sin(TIME*speed), UV.y);
	vec2 uv2 =vec2(UV.x-sin(TIME*speed), UV.y);
	vec2 uv3 =vec2(UV.x , UV.y + sin(TIME*speed));
	
	float noise_r = texture( noise_img,uv1).r;
	float noise_b = texture( noise_img,uv2).g;
	float noise_g = texture( noise_img,uv3).b;
	
	vec3 new_color = vec3(noise_r,noise_g,noise_b);
	
	float new_alpha = noise_r *noise_b*noise_g;
	COLOR.rgb=smoke_color.rgb;//texture(TEXTURE,UV).rgb; 
	COLOR.a= clamp(new_alpha*3.* texture(TEXTURE,UV).a,0.0,1.0);
	
}



