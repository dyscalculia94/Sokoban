extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_WallBlock_area_entered(area):
	area.return_to_prev()

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