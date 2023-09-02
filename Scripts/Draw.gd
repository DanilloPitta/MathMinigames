extends Control

var pressed = false
var current_line

func _on_gui_input(event):
	if event.position.y > 0:
		if event is InputEventMouseButton:
			pressed = event.pressed
			
			if pressed:
				current_line = Line2D.new()
				current_line.default_color = Color.WHITE
				current_line.width = 1
				$Draw/Lines.add_child(current_line)
				
		if event is InputEventMouseMotion && pressed:
			current_line.add_point(event.position)

func _on_erase_btn_pressed():
	var lines = $Draw/Lines.get_children()
	for line in lines:
		line.queue_free()
