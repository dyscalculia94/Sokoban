extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var level1 = load("res://scenes/Level1.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/VBoxContainer/HBoxContainer/NewGame.connect("gui_input", self, "_on_NewGame_gui_input")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_NewGame_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		print("HELLO")
		$MarginContainer.visible = false
		add_child(level1.instance())