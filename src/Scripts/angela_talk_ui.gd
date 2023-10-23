extends CanvasLayer

var current_text_idx = 0

var texts = [
	{ "text": "Olá estudante, boas vindas ao minigame MathVaults!", "cam_x": 0, "cam_y": 0 },
	{ "text": "Você deve coletar as incógnitas perdidas pelo mapa", "cam_x": 500, "cam_y": 65 },
	{ "text": "Depois resolva o problema proposto no display do cofre", "cam_x": 450, "cam_y": -60 },
	{ "text": "Isso vai liberar o cofre que contem sua recompensa", "cam_x": 450, "cam_y": -60 },
	{ "text": "Resolva os cofres até encontrar a chave para passar a fase", "cam_x": 500, "cam_y": -60 },
	{ "text": "Bom jogo!", "cam_x": 0, "cam_y": 0 }
]

func _ready():
	Global.paused = true

	get_parent().get_node("CharacterBody2D").animated_sprite.animation = "idle"
	
	get_node("ColorRect/Text").text = texts[current_text_idx].text

func _on_next_btn_pressed():
	current_text_idx += 1
	get_node("ColorRect/Text").text = texts[current_text_idx].text
	get_parent().get_node("CharacterBody2D/RemoteTransform2D").position.x = texts[current_text_idx].cam_x
	get_parent().get_node("CharacterBody2D/RemoteTransform2D").position.y = texts[current_text_idx].cam_y
	
	if current_text_idx == 5:
		queue_free()
		Global.paused = false
		
