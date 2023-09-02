extends Area2D

var alreadly_collected = false

func _ready():
	Global.total_coins += 1
	$"../../Hud".update_coin_hud()

func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		if alreadly_collected == false:
			alreadly_collected = true
			Global.coins_collected += 1
			var hud = $"../../Hud"
			hud.update_coin_hud()
			$AnimatedSprite2D.play("particles")


func _on_animated_sprite_2d_animation_finished():
	queue_free()
