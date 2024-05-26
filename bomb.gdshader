shader_type canvas_item;

uniform float detonatetimer : hint_range(1.0,10.0);
void fragment() {		
    vec4 uv = texture(TEXTURE, UV);
    // Calculate the scale factor oscillating between 0.5 and 1.5
    float scale = 1.0 + 0.5 * sin(TIME *detonatetimer);
    // Adjust UV coordinates based on the scale
   // vec4 center = vec4(0.5, 0.5,0.5,0.5);
  //  uv = (uv - center) / scale + center;
    // Sample the texture
    vec4 texColor = texture(TEXTURE, UV);
    // Change color to red if the scale factor is greater than 1.25
    if (scale > 1.0) {
        texColor.rgb *= vec3(0.7,0.0 ,0.0); // Red color
    }
    COLOR = texColor;
}
void vertex() {
    // Scale the vertices around the center
    float scale = 1.0 + 0.4 * sin(TIME*detonatetimer);
    vec2 center = vec2(0.5, 0.5);
    VERTEX = (VERTEX - center) * scale + center;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
