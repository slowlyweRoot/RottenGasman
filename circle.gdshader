shader_type canvas_item;
const float speed=0.5;
uniform sampler2D noise_texture:repeat_enable;
uniform sampler2D SCREEN_TEXTURE:hint_screen_texture,filter_linear_mipmap;
void fragment() {
	vec2 distortedUV= SCREEN_UV + texture(noise_texture, UV).r*0.005;
	vec4 screenColor= texture(SCREEN_TEXTURE, distortedUV);
	COLOR = screenColor;
	
	//vec2 uv_update = vec2 (UV.x + TIME* speed, UV.y +TIME* speed);
	//COLOR = texture(noise_texture,uv_update);
}


