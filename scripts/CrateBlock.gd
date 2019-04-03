extends Area2D

var prev_position
var returned

func _ready():
	pass # Replace with function body.
	
func return_to_prev():
	position = prev_position
	returned = true
	
func move(dir):
	prev_position = position
	position += dir

func reset_returned():
	returned = false

func get_area_type():
	return "CRATE"

func get_returned():
	return returned