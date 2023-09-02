extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("bounce_in")
	
	await get_tree().create_timer(3.0).timeout
	
	queue_free()
