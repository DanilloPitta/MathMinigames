extends CanvasLayer

var type
var value

func _ready():
	$AnimationPlayer.play("fade_in")
	
	if type == "x":
		$MarginContainer/ColorRect/TextureRect.texture = load("res://Assets/Sprites/ValuesBubbles/x_bubble.png")
		$MarginContainer/ColorRect/Title.text = "VOCÊ OBTEVE O VALOR DE X"
		$MarginContainer/ColorRect/Value.text = value
	elif type == "y":
		$MarginContainer/ColorRect/TextureRect.texture = load("res://Assets/Sprites/ValuesBubbles/y_bubble.png")
		$MarginContainer/ColorRect/Title.text = "VOCÊ OBTEVE O VALOR DE Y"
		$MarginContainer/ColorRect/Value.text = value
		
	await get_tree().create_timer(3.0).timeout
	
	queue_free()
