extends Area2D

func _ready():
	pass # Replace with function body.

func get_area_type():
	return "WALL"

func can_move(dir):
	return false