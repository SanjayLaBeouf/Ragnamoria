extends TextureRect

@export var fade_time := 2.0
var timer := 0.0

func _process(delta):
	if modulate.a < 1.0:
		timer += delta
		modulate.a = clamp(timer / fade_time, 0.0, 1.0)
