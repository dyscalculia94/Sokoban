extends "Level.gd"

var crates_num = 0

func _ready():
	crates_num = get_child(0).get_children().size()
#	for i in self.get_children():
#		if i.get_area_type() == "CRATE":
#			crates_num += 1
	print("Number of crates on the level: " + str(crates_num))

func _process(delta):
	if crates_num == 0:
		print("THE END!")
		crates_num += 10