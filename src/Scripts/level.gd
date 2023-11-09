extends Node2D

@export var level_plate : String
@export var level_number : int

@onready var level_plate_scene = preload("res://src/Scenes/level_plate.tscn")

func _ready():
	Global.paused = false
	var level_plate_ = level_plate_scene.instantiate()
	level_plate_.plate_texture = level_plate
	self.add_child(level_plate_)
