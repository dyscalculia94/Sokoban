extends Node

var level1 = load("res://scenes/Level1.tscn")
var current_level

func _ready():
	$MainMenu/VBoxContainer/HBoxContainer/NewGame.connect("gui_input", self, "_on_NewGame_gui_input")

func _level_finished():
	print("LEVEL_FINISHED")
	current_level.queue_free()
	$MainMenu.visible = true

func _on_NewGame_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		print("HELLO")
		$MainMenu.visible = false
		current_level = level1.instance()
		add_child(current_level)
		current_level.connect("level_finished", self, "_level_finished")