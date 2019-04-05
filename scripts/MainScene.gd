extends Node

var levels
var cur_level
var cur_level_num = 0

func _ready():
	$MainMenu/VBoxContainer/HBoxContainer/NewGame.connect("gui_input", self, "_on_NewGame_gui_input")
	load_levels()

func _level_finished():
	print("LEVEL_FINISHED")
	cur_level.queue_free()
	$MainMenu.visible = true

func _on_NewGame_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		print("HELLO")
		$MainMenu.visible = false
		cur_level = levels[cur_level_num].instance()
		add_child(cur_level)
		cur_level.connect("level_finished", self, "change_level")

func change_level():
	cur_level.visible = false
	cur_level.queue_free()
	cur_level_num += 1
	if cur_level_num < 3:
		cur_level = levels[cur_level_num].instance()
		add_child(cur_level)
		cur_level.connect("level_finished", self, "change_level")
	else:
		$MainMenu.visible = true
		cur_level_num = 0
		print("YOU FINISHED ALL OF THE LEVELS")

func load_levels():
	levels = {	0 : load("res://scenes/levels/Level1.tscn"),
				1: load("res://scenes/levels/Level2.tscn"),
				2: load("res://scenes/levels/Level3.tscn") }