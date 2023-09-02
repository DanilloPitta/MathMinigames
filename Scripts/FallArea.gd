extends Area2D

#const SPAWN_POINT

func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		var player = get_parent().get_node("CharacterBody2D")
		player.position = Vector2(35, 136)
