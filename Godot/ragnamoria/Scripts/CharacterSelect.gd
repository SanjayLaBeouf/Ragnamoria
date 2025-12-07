extends Node2D

# Ordered list of selectable characters
var characters = ["Fighter", "Mage", "Ranger"]
var index := 0

@onready var character_display: AnimatedSprite2D = $CanvasLayer/CharacterDisplay
@onready var left_button: Button = $CanvasLayer/LeftButton
@onready var right_button: Button = $CanvasLayer/RightButton
@onready var start_button: Button = $CanvasLayer/StartButton
@onready var label = $CanvasLayer/Label

var current_char 

func _ready():
	update_character_display()
	left_button.pressed.connect(_on_LeftButton_pressed)
	right_button.pressed.connect(_on_RightButton_pressed)
	start_button.pressed.connect(_on_StartButton_pressed)



# ---------------------------------
#  UPDATE PREVIEW
# ---------------------------------
func update_character_display():
	current_char = characters[index]
	label.text = current_char
	character_display.play(current_char + "_right")


# ---------------------------------
#  BUTTON SIGNALS
# ---------------------------------
func _on_LeftButton_pressed():
	index = (index - 1 + characters.size()) % characters.size()
	update_character_display()

func _on_RightButton_pressed():
	index = (index + 1) % characters.size()
	update_character_display()

func _on_StartButton_pressed():
	Global.selected_character = characters[index]
	print("Selected:", Global.selected_character)
	
	get_tree().change_scene_to_file("res://Scene/main.tscn")
	
