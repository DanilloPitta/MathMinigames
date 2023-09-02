extends CanvasLayer


func _ready():
	display_stars()
	
func display_stars():
	var coins_collected = Global.coins_collected
	var total_coins = Global.total_coins
	if coins_collected >= total_coins - 1:
		get_node("CenterContainer/Control/ColorRect/Stars/Colored/1").visible = true
		get_node("CenterContainer/Control/ColorRect/Stars/Colored/2").visible = true
		get_node("CenterContainer/Control/ColorRect/Stars/Colored/3").visible = true
	elif coins_collected == total_coins - 2:
		get_node("CenterContainer/Control/ColorRect/Stars/Colored/1").visible = true
		get_node("CenterContainer/Control/ColorRect/Stars/Colored/2").visible = true
		get_node("CenterContainer/Control/ColorRect/Stars/Blank/3").visible = true
	elif coins_collected <= total_coins - 3:
		get_node("CenterContainer/Control/ColorRect/Stars/Colored/1").visible = true
		get_node("CenterContainer/Control/ColorRect/Stars/Blank/2").visible = true
		get_node("CenterContainer/Control/ColorRect/Stars/Blank/3").visible = true
