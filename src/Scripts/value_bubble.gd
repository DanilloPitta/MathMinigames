extends Area2D

@onready var colleted_bubble_alert = preload("res://src/Scenes/collected_bubble_alert.tscn")

@export var type : String
@export var value : String

var alreadly_collected = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if type == "x":
		get_node("AnimatedSprite2D").play("x")
	elif type == "y":
		get_node("AnimatedSprite2D").play("y")
	elif type == "z":
		get_node("AnimatedSprite2D").play("z")

func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		if alreadly_collected == false: # Evitar bug de modal abrir mais de uma vez
			alreadly_collected = true
			if type == "x":
				Global.colleted_bubble_x = value
			elif type == "y":
				Global.colleted_bubble_y = value
			elif type == "z":
				Global.colleted_bubble_z = value
				
			$AnimatedSprite2D.play("collected")
			
			var alert = colleted_bubble_alert.instantiate()
			alert.type = type
			alert.value = value
			get_parent().add_child(alert)


func _on_animated_sprite_2d_animation_finished():
	queue_free()
