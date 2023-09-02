extends StaticBody2D

@export var id : int

func open_door():
	$AnimatedSprite2D.play("open")


func _on_animated_sprite_2d_animation_finished():
	queue_free()
