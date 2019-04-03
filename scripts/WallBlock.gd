extends Area2D

func _ready():
	pass # Replace with function body.

func _on_WallBlock_area_entered(area):
	area.return_to_prev()

func get_area_type():
	return "WALL"

#func _input(event):
#	if event is InputEventKey and event.pressed:
#		if event.scancode == KEY_A:
#			print("KEY_LEFT")
#			position += Vector2(-64, 0)
#		if event.scancode == KEY_D:
#			print("KEY_RIGHT")
#			position += Vector2(64, 0)
#		if event.scancode == KEY_W:
#			print("KEY_UP")
#			position += Vector2(0, -64)
#		if event.scancode == KEY_S:
#			print("KEY_DOWN")
#			position += Vector2(0, 64)