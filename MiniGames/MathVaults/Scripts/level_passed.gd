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


func _on_reload_pressed():
	get_tree().reload_current_scene()

func _on_advance_pressed():
	Global.current_level += 1
	reset_global_vars()
	get_tree().change_scene_to_file("res://MiniGames/MathVaults/Levels/level_" + str(Global.current_level) + ".tscn")
	
func reset_global_vars():
	Global.key_collected = false
	Global.colleted_bubble_x = null
	Global.colleted_bubble_y = null
	Global.colleted_bubble_z = null
	Global.coins_collected = 0
	Global.total_coins = 0
