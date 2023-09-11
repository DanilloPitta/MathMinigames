extends Area2D

@onready var angela_talk_ui = preload("res://MiniGames/MathVaults/Scenes/angela_talk_ui.tscn")

var tutorial_completed = false


func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		if !tutorial_completed:
			tutorial_completed = true
			
			var ui = angela_talk_ui.instantiate()
			get_parent().add_child(ui)
