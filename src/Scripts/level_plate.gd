extends CanvasLayer

var plate_texture

func _ready():
	$Control/TextureRect.texture = load("res://src/Assets/Hud/Levels_Plates/" + plate_texture)
	
	$AnimationPlayer.play("fade_in")
