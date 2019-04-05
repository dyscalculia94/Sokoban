extends "Level.gd"

var crates_num = 0
var moves_num = 0

var running = true

var MainScene = load("res://scenes/MainScene.tscn")
var LevelFinishedScreen = load("res://scenes/LevelFinishedScreen.tscn")

func _ready():
	crates_num = get_child(0).get_children().size()
#	for i in self.get_children():
#		if i.get_area_type() == "CRATE":
#			crates_num += 1
	print("Number of crates on the level: " + str(crates_num))

func _process(delta):
	if running and crates_num == 0:
		print("THE END!")
		print("Total number of moves: " + str(moves_num))
		running = false
#		var lfs = LevelFinishedScreen.instance()
#		add_child(lfs)
#		lfs.popup()
#		lfs.get_child(0).text = "TOTAL MOVES = " + str(moves_num)
		emit_signal("level_finished")