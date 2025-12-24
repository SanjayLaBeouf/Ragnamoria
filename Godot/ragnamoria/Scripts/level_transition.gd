extends CanvasLayer

@onready var color_rect: ColorRect = $ColorRect

var scene_to_load: String
var color_rect_tween: Tween

func change_scene_to(scene_path: String) -> void:
	if color_rect_tween:
		color_rect_tween.kill()
	
	scene_to_load = scene_path
	get_tree().paused = true
	
	color_rect_tween = create_tween().set_trans(Tween.TRANS_SINE)
	color_rect_tween.tween_property(color_rect, "modulate:a", 1.0, 0.2).connect("finshied", _load_new_scene)
	#Inside the tween_property the (x,y)is the coordinates of where they are leaving from, and the float is the time it takes #
	color_rect_tween.chain().tween_property(color_rect, "modulate:a", 0.0, 0.4)
	#Inside of this the (x,y) are the coordinates of where they will reappearing from, and the float is the the time it takes #
	
func _load_new_scene() -> void:
	get_tree().paused = false
	get_tree().call_deferred("chaange_scene_to_file", scene_to_load)
