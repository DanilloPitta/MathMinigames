extends Button

@export var level_id : int

func _on_pressed():
	Global.current_level = level_id
	get_tree().change_scene_to_file("res://src/Levels/level_" + str(level_id) + ".tscn")
