extends Area2D

@export var equation_id : int
@export var door_id : int

var completed = false
var tip_unlocked = false

func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		if completed == false && Global.equation_form_oppened == false:
			Global.equation_form_oppened = true
			
			body.position.y = self.position.y
			body.animated_sprite.animation = "idle"
			
			var form = load("res://src/Scenes/equation_form.tscn").instantiate()
			form.equation_id = equation_id
			form.display = self
			
			get_parent().add_child(form)
