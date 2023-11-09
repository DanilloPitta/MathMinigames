extends Control


func _ready():
	Global.paused = true


func _on_back_pressed():
	get_tree().change_scene_to_file("res://src/Menu/menu.tscn")

func _on_continue_pressed():
	queue_free()
