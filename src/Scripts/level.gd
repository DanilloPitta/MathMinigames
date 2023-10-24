extends Node2D

@export var level_plate : String
@export var level_number : int

@onready var level_plate_scene = preload("res://src/Scenes/level_plate.tscn")

func _ready():
	var level_plate_ = level_plate_scene.instantiate()
	level_plate_.plate_texture = level_plate
	get_parent().add_child(level_plate_)
	
	await get_tree().create_timer(4.2).timeout
	
	level_plate_.queue_free()
