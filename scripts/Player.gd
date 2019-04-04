extends Area2D

var prev_position
var CollisionTester = load("res://scenes/CollisionTester.tscn")

func _ready():
	pass

func return_to_prev():
	position = prev_position

func _input(event):
	if event is InputEventKey and !event.pressed:
		if event.scancode == KEY_R:
			position = prev_position
		else:
			var dir = get_position_vec(event)
			if (yield(can_move(dir), "completed") == true) and (dir != Vector2(0, 0)):
				prev_position = position
				position += dir
#				print("PLAYER MOVED")

func _on_Player_area_entered(area):
	match area.get_area_type():
		"CRATE":
			if (area.get_returned()):
				area.reset_returned()
				return_to_prev()
			else:
				area.move(position - prev_position)
#			print("CRATE BLOCK")
		"WALL":
#			print("WALL BLOCK")
			pass
		_:
#			print("UNKNOWN BLOCK")
			pass

func get_area_type():
	return "PLAYER"

func get_position_vec(event):
	match event.scancode:
		KEY_LEFT:
			return Vector2(-64, 0)
		KEY_RIGHT:
			return Vector2(64, 0)
		KEY_UP:
			return Vector2(0, -64)
		KEY_DOWN:
			return Vector2(0, 64)
		_:
			return Vector2(0, 0)

func can_move(dir):
	var tester = CollisionTester.instance()
	get_parent().add_child(tester)
	tester.position = position + dir
	$Timer.set_wait_time(0.05)
	$Timer.start()
	yield($Timer, "timeout")
	
	var temp = true
	for area in tester.get_overlapping_areas():
		if area.get_area_type() == "WALL":
			temp = false
		else:
			temp = yield(area.can_move(dir), "completed")
	
	tester.free()
	return temp