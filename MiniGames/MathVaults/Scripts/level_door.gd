extends Area2D

@onready var no_key_alert = preload("res://MiniGames/MathVaults/Scenes/no_key_alert.tscn")
@onready var level_passed_alert = preload("res://MiniGames/MathVaults/Scenes/level_passed.tscn")

var alert_opened = false

func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		if Global.key_collected == true:
			if alert_opened == false:
				alert_opened = true
				var alert = level_passed_alert.instantiate()
			
				get_parent().add_child(alert)
		else:
			if alert_opened == false:
				alert_opened = true
				var alert = no_key_alert.instantiate()
				
				get_parent().add_child(alert)
				
				await get_tree().create_timer(3.0).timeout
				alert_opened = false
				alert.queue_free()
				
				
