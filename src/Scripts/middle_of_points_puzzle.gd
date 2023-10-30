extends Node2D

var x1 = 3
var x2 = 0
var y1 = 2
var y2 = 2

func _ready():
	$Crate.position.x = $Crate.position.x + 100
	print(calc_middle_of_two_points(x1,x2,y1,y2))
	
	
func calc_middle_of_two_points(x1, x2, y1, y2):
	return pow(pow(x2 - x1, 2) + pow(y2 - y1, 2), (1.0/2.0))

