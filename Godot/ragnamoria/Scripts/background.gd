extends Node2D

# Speed of scrolling in pixels per second
var scroll_speed := 200

# References to the sprites
@onready var sprite1 := $Sprite2D
@onready var sprite2 := $Sprite2D2

func _process(delta):
	# Move both sprites left
	sprite1.position.x -= scroll_speed * delta
	sprite2.position.x -= scroll_speed * delta
	
	# If a sprite moves off screen, move it to the right of the other sprite
	if sprite1.position.x <= -sprite1.texture.get_width():
		sprite1.position.x = sprite2.position.x + sprite2.texture.get_width()
		
	if sprite2.position.x <= -sprite2.texture.get_width():
		sprite2.position.x = sprite1.position.x + sprite1.texture.get_width()
