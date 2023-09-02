extends Area2D

@onready var collected_key_alert = preload("res://Scenes/collected_key_alert.tscn")

func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		Global.key_collected = true
		$AnimatedSprite2D.play("collected")
		
		$"../Hud".display_key()
		
		var alert = collected_key_alert.instantiate()
		get_parent().add_child(alert)

func _on_animated_sprite_2d_animation_finished():
	queue_free()
