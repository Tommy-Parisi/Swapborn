extends CharacterBody2D

@export var speed: float = 90.0
var is_controlled := false

func _physics_process(delta):
	if not is_controlled:
		return

	var dir = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = dir * speed

	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = -200.0

	velocity.y += 200 * delta # Gravity
	move_and_slide()

func become_controlled():
	is_controlled = true
	$Camera2D.make_current()
	print(name, " is now controlled")

func release_control():
	is_controlled = false
	#$Sprite.modulate = Color(0.5, 0.5, 0.5) # Change color to grey
	print(name, " released controll")
