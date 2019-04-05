extends Area2D

func _ready():
	pass # Replace with function body.

func get_area_type():
	return "CRATE_DEST"

func _on_CrateDest_area_entered(area):
	get_parent().get_parent().crates_num -= 1;
#	print("CRATE_DEST_ENTERED")
	area.switch_texture()

func _on_CrateDest_area_exited(area):
	get_parent().get_parent().crates_num += 1;
#	print("CRATE_DEST_EXITED")
	area.switch_texture()