extends Area2D

var prev_position
var returned
var CollisionTester = load("res://scenes/CollisionTester.tscn")

var textures = [load("res://assets/crates/crate_07.png"), load("res://assets/crates/crate_42.png")]
var cur_texture = 1

func _ready():
	prev_position = position

func move(dir):
	prev_position = position
	position += dir

func return_to_prev():
	position = prev_position
	returned = true

func reset_returned():
	returned = false

func get_area_type():
	return "CRATE"

func get_returned():
	return returned

func switch_texture():
	cur_texture = 1 - cur_texture
	$Sprite.texture = textures[cur_texture]

func can_move(dir):
	var tester = CollisionTester.instance()
	get_parent().add_child(tester)
	tester.position = position + dir
	$Timer.set_wait_time(0.05)
	$Timer.start()
	yield($Timer, "timeout")
	
	var temp = tester.get_overlapping_areas().empty()
	tester.free()
	return temp