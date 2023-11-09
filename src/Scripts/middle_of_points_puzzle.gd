extends Node2D

@onready var resolution_ui = preload("res://src/Scenes/UI/MOPPuzzle/mop_puzzle_resolution_ui.tscn")
@onready var npc_talk = preload("res://src/Scenes/npc_talk_scene.tscn")
var npc_talk_texts = [
	"Olá viajante, oque fazes por aqui?",
	"Poderia me dar uma mãozinha?",
	"Preciso colocar aquela caixa exatamente no meio daquela reta.",
	"Me ajude a calcular o ponto médio entre as duas extremidades da reta.",
	"Depois poderei empilhar a caixa"
]
var npc_talk_texture = "res://src/Assets/Sprites/NPCs/Worker/single_frame.png"

var completed = false

func _on_entrance_area_body_entered(body):
	if body.name == "CharacterBody2D" and completed == false:
		Global.paused = true
		$AnimatedSprite2D.flip_h = true
		var npc_talk_scene = npc_talk.instantiate()
		npc_talk_scene.text_changed.connect(_on_npc_talk_text_changed)
		npc_talk_scene.npc_img_path = npc_talk_texture
		npc_talk_scene.texts = npc_talk_texts
		get_parent().add_child(npc_talk_scene)
		
func _on_npc_talk_text_changed(idx):
	if idx == 2:
		get_parent().get_node("CharacterBody2D/RemoteTransform2D").position.x = 220
		get_parent().get_node("CharacterBody2D/RemoteTransform2D").position.y = -40
		get_parent().get_node("Camera2D").zoom.x = 1.3
		get_parent().get_node("Camera2D").zoom.y = 1.3
	if idx == 4:
		$AnimatedSprite2D.flip_h = false
		var resolution_ui_scene = resolution_ui.instantiate()
		resolution_ui_scene.completed.connect(_on_resolution_ui_completed)
		get_parent().add_child(resolution_ui_scene)
		
func _on_npc_talk2_end():
	$AnimationPlayer.play("picker_to_deploy_pos")
	await $AnimationPlayer.animation_finished
	await get_tree().create_timer(0.5).timeout
	$AnimationPlayer.play("deploy_crate")
	await $AnimationPlayer.animation_finished
	
	var npc_talk_scene = npc_talk.instantiate()
	npc_talk_scene.npc_img_path = npc_talk_texture
	npc_talk_scene.texts = ["Perfeito! Obrigado viajante."]
	npc_talk_scene.end.connect(_on_npc_talk3_end)
	get_parent().add_child(npc_talk_scene)
	
func _on_npc_talk3_end():
	get_parent().get_node("CharacterBody2D/RemoteTransform2D").position.x = 0
	get_parent().get_node("CharacterBody2D/RemoteTransform2D").position.y = 0
	get_parent().get_node("Camera2D").zoom.x = 2
	get_parent().get_node("Camera2D").zoom.y = 2
	Global.paused = false
	completed = true
		
func _on_resolution_ui_completed():
	var npc_talk_scene = npc_talk.instantiate()
	npc_talk_scene.npc_img_path = npc_talk_texture
	npc_talk_scene.texts = ["Isso! Era isso mesmo que eu precisava!"]
	npc_talk_scene.end.connect(_on_npc_talk2_end)
	get_parent().add_child(npc_talk_scene)
		
