extends Area2D

@export var equation_id : int
@export var door_id : int

var completed = false
var tip_unlocked = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		if completed == false && Global.equation_form_oppened == false:
			Global.equation_form_oppened = true
			
			var form = load("res://MiniGames/MathVaults/Scenes/equation_form.tscn").instantiate()
			form.equation_id = equation_id
			form.display = self
			
			get_parent().add_child(form)
