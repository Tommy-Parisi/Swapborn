extends CharacterBody2D

@export var speed: float = 500.0
var is_controlled := false
var is_alive := true
@onready var anim := $AnimatedSprite2D 

func _physics_process(delta):
	if not is_alive:
		return
	if is_controlled:
		handle_player_input(delta)


func handle_player_input(delta):
	var direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = direction * speed

	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = -500.0
	
	if not is_on_floor() and Input.is_action_pressed("ui_down"):
		velocity.y += 25

	velocity.y += 500 * delta # Gravity
	
	# Flip sprite based on movement direction
	if direction != 0:
		anim.flip_h = direction < 0

	# Set animation state
	if is_on_floor():
		if direction != 0:
			if anim.animation != "walk":
				anim.play("walk")
		else:
			if anim.animation != "idle":
				anim.play("idle")
	else:
		# Optional: you can set a "jump" or "fall" animation here later if you want
		pass
	
	move_and_slide()


func become_controlled():
	is_controlled = true
	$Camera2D.make_current()
	$Camera2D.zoom = Vector2(0.5, 0.5)
	print(name, " is now controlled")

func release_control():
	is_controlled = false
	print(name, " released controll")

func _on_death_zone_2_body_entered(body: Node2D) -> void:
	if body == self:
		die()

func die():
	print(name, " DIED")
	$AnimatedSprite2D.modulate = Color(1, 0, 0) # Change color to grey
	anim.play("dead")
	if not is_alive:
		return
	is_alive = false
