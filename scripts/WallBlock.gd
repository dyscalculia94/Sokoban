extends Area2D

func _ready():
	pass # Replace with function body.

func _on_WallBlock_area_entered(area):
	area.return_to_prev()

func get_area_type():
	return "WALL"