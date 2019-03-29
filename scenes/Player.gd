extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_LEFT:
			print("KEY_LEFT")
			position += Vector2(-64, 0)
		if event.scancode == KEY_RIGHT:
			print("KEY_RIGHT")
			position += Vector2(64, 0)
		if event.scancode == KEY_UP:
			print("KEY_UP")
			position += Vector2(0, -64)
		if event.scancode == KEY_DOWN:
			print("KEY_DOWN")
			position += Vector2(0, 64)