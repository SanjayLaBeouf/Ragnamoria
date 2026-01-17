shader_type canvas_item;

uniform vec2 offset = vec2(0.0, 0.0); // controlled by script

void fragment() {
    vec2 uv = UV + offset;
    uv = fract(uv); // wrap coordinates
    COLOR = texture(TEXTURE, uv);
}
