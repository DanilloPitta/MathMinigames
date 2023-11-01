extends CanvasLayer

var xma_correct_value = "1,5"
var xmb_correct_value = "2"

signal completed

func _on_submit_pressed():
	if $Control/CenterContainer/TextureRect/LineEditXma.text == xma_correct_value and $Control/CenterContainer/TextureRect/LineEditXmb.text == xmb_correct_value:
		completed.emit()
		queue_free()
