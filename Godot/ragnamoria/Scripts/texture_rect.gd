extends TextureRect

@export var scroll_speed := 50.0 # pixels per second
var offset := Vector2.ZERO

func _process(delta):
	# Convert pixels to UV units
	var uv_shift = scroll_speed * delta / texture.get_width()
	offset.x += uv_shift

	# Keep offset.x between 0 and 1
	offset.x = fmod(offset.x, 1.0)

	# Update the shader parameter
	material.set_shader_parameter("offset", offset)
