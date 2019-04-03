extends Area2D

var prev_position

func _ready():
	pass

func return_to_prev():
	position = prev_position

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_LEFT:
			print("KEY_LEFT")
			prev_position = position
			position += Vector2(-64, 0)
		if event.scancode == KEY_RIGHT:
			print("KEY_RIGHT")
			prev_position = position
			position += Vector2(64, 0)
		if event.scancode == KEY_UP:
			print("KEY_UP")
			prev_position = position
			position += Vector2(0, -64)
		if event.scancode == KEY_DOWN:
			print("KEY_DOWN")
			prev_position = position
			position += Vector2(0, 64)
		if event.scancode == KEY_R:
			print("KEY_R")
			position = prev_position

func _on_Player_area_entered(area):
	return_to_prev()