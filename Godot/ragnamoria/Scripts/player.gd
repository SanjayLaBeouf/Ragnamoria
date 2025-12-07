extends CharacterBody2D

@export var speed: float = 150.0
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

var characters = ["Fighter", "Mage", "Ranger"]
var enable: bool = false
var last_horizontal_dir: String = "walking_right"  # default facing direction
var character_animations = "res://characters/"
var selected_character 


func _ready():
	# Apply the selected character from Global if it exists
	if Global.selected_character != "":
		for i in range(characters.size()):
			if Global.selected_character == characters[i]:
				print("Match")
				selected_character = load(character_animations + Global.selected_character + ".tres")
		anim.set_sprite_frames(selected_character)
		set_character(Global.selected_character)
	enable = true

func _physics_process(delta: float) -> void:
	if not enable:
		return

	# --- Movement input ---
	var input_vector = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)

	if input_vector.length() > 0:
		input_vector = input_vector.normalized() * speed
	else:
		input_vector = Vector2.ZERO

	velocity = input_vector
	move_and_slide()

	# --- Track facing direction ---
	if Input.get_action_strength("ui_right") > 0:
		last_horizontal_dir = "walking_right"
	elif Input.get_action_strength("ui_left") > 0:
		last_horizontal_dir = "walking_left"

	# --- Animation logic ---
	if input_vector != Vector2.ZERO:
		# Horizontal movement takes priority
		if input_vector.x != 0:
			if input_vector.x > 0:
				anim.play("walking_right")
			else:
				anim.play("walking_left")
		else:
			# Moving vertically → use last horizontal direction
			anim.play(last_horizontal_dir)
	else:
		anim.stop()
		anim.frame = 0

# --- Set the player character animation from selection ---
func set_character(character_name: String) -> void:
	if anim:
		# Play the default facing right animation for preview
		anim.play("walking_right")
		 #anim.play()
		
