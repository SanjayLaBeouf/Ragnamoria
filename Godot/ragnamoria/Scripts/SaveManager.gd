extends Node

const SAVE_PATH := "user://savegame.json"

var selected_character: int = 0   # ← ADD THIS

func save_game(data: Dictionary) -> void:
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(data))
		file.close()

func load_game() -> Dictionary:
	if not FileAccess.file_exists(SAVE_PATH):
		return {}

	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	return JSON.parse_string(content)

func save_exists() -> bool:
	return FileAccess.file_exists(SAVE_PATH)
