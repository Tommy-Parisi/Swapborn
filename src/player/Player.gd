extends CharacterBody2D

@export var speed: float = 100.0
@export var jump_velocity: float = -500.0

@onready var death_zone := $"../DeathZone"
@onready var anim := $AnimatedSprite2D 

var is_alive := true

func _ready():
	await get_tree().create_timer(0.2)
	$Camera2D.make_current()

func _physics_process(delta):
	if not is_alive:
		return

	var direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = direction * speed

	# Flip sprite based on movement direction
	if direction != 0:
		anim.flip_h = direction < 0

	# Set animation state
	if is_on_floor():
		if direction != 0:
			if anim.animation != "run":
				anim.play("run")
		else:
			if anim.animation != "idle":
				anim.play("idle")
	else:
		# Optional: you can set a "jump" or "fall" animation here later if you want
		pass

	# Jumping
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = jump_velocity

	# Fast fall
	if not is_on_floor() and Input.is_action_pressed("ui_down"):
		velocity.y += 25

	# Gravity
	velocity.y += 500 * delta
	move_and_slide()

func die():
	print("PLAYER DIED")
	if not is_alive:
		return
	is_alive = false
	$AnimatedSprite2D.modulate = Color(1, 0, 0) # Change color to red
	anim.play("dead")
	get_tree().call_group("swap_logic", "on_player_death", global_position)
	

func _on_death_zone_2_body_entered(body: Node2D) -> void:
	if body == self:
		die()
