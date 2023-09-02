extends CharacterBody2D


const SPEED = 100
const JUMP_VELOCITY = -280.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var animated_sprite

func _ready():
	if randf() > 0.5:
		animated_sprite = $Danillo
	else:
		animated_sprite = $Tayna
		
	animated_sprite.visible = true

func _physics_process(delta):
	if Global.paused == false:
		# Add the gravity.
		if not is_on_floor():
			velocity.y += gravity * delta
			
			if velocity.y <= 0:	
				animated_sprite.animation = "jump"
			else:
				animated_sprite.animation = "falling"
				
		else:
			if velocity.x == 0:
				animated_sprite.animation = "idle"
			else:
				animated_sprite.animation = "run"

		# Handle Jump.
		if Input.is_action_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
			
			if velocity.x < 0:
				animated_sprite.flip_h = true
			else:
				animated_sprite.flip_h = false
			
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()
