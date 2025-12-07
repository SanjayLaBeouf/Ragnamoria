extends Control

@onready var continue_button = $CanvasLayer/VBoxContainer/ContinueButton

func _ready() -> void:
	print("ContinueButton reference =", continue_button)

	if continue_button == null:
		push_error("ContinueButton path is WRONG! Fix the @onready var path.")
		return

	continue_button.visible = SaveManager.save_exists()


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/CharacterSelect.tscn")
	print("Start Button")

func _on_continue_button_pressed() -> void:
	var data = SaveManager.load_game()
	# Load player scene and apply save data
	var game_scene = load("res://Scene/CharacterSelect.tscn").instantiate()
	get_tree().root.add_child(game_scene)
	get_tree().current_scene = game_scene

	# Example: pass data to a global player manager
	PlayerData.load_from_save(data)

func _on_quit_button_pressed() -> void:
	get_tree().quit()
