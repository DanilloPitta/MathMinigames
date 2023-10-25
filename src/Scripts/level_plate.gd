extends CanvasLayer

var plate_texture

func _ready():
	$Control/TextureRect.texture = load("res://src/Assets/Hud/Levels_Plates/" + plate_texture)
	
	$AnimationPlayer.play("fade_in")
	
	await get_tree().create_timer(4.2).timeout
	
	$AnimationPlayer.play("bounce_out")
	
	await $AnimationPlayer.animation_finished
	
	self.queue_free()
