extends Node2D

var x1 = 3
var x2 = 0
var y1 = 2
var y2 = 2

func _ready():
	print(calc_middle_of_two_points(x1,x2,y1,y2))
	
	await get_tree().create_timer(5).timeout
	
	$AnimationPlayer.play("picker_to_deploy_pos")
	await $AnimationPlayer.animation_finished
	await get_tree().create_timer(0.5).timeout
	$AnimationPlayer.play("deploy_crate")
	
func calc_middle_of_two_points(x1, x2, y1, y2):
	return pow(pow(x2 - x1, 2) + pow(y2 - y1, 2), (1.0/2.0))
	

