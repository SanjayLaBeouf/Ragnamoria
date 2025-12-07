extends Node2D

@onready var player = $Player  # adjust path if needed

func _ready():
	print("mainscene in dis bitch ", Global.selected_character)
	if Global.selected_character != "":
		player.set_character(Global.selected_character)
	player.enable = true
