extends CanvasLayer

signal end
signal text_changed(text_index)

var texts
var npc_img_path

var current_text_idx = 0


func _ready():
	get_parent().get_node("CharacterBody2D").animated_sprite.animation = "idle"
	
	get_node("ColorRect/Text").text = texts[current_text_idx]
	$ColorRect/Sprite2D.texture = load(npc_img_path)
	
	text_changed.emit(current_text_idx)


func _on_next_btn_pressed():
	if len(texts) == 1:
		end.emit()
		queue_free()
		return
	
	current_text_idx += 1
	get_node("ColorRect/Text").text = texts[current_text_idx]
	text_changed.emit(current_text_idx)
	
	if current_text_idx == len(texts) - 1:
		end.emit()
		queue_free()
