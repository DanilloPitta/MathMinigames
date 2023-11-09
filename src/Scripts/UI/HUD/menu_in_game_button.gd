extends Control

@onready var menu_in_game_scene = preload("res://src/Scenes/UI/HUD/menu_in_game.tscn")

func _on_open_pressed():
	var menu_in_game_instance = menu_in_game_scene.instantiate()
	get_node("..").add_child(menu_in_game_instance)
