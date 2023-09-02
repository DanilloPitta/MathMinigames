extends Button

@export var level_id : int

func _on_pressed():
	get_tree().change_scene_to_file("res://MiniGames/MathVaults/Levels/level_" + str(level_id) + ".tscn")
