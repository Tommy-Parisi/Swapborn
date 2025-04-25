extends CharacterBody2D

@export var speed: float = 100.0
@export var jump_velocity: float = -500.0

@onready var death_zone := $"../DeathZone"

var is_alive := true
var just_spawned := true

func _ready():
	await get_tree().create_timer(0.2)
	just_spawned = false
	$Camera2D.make_current()
	

func _physics_process(delta):
	if not is_alive:
		return

	var direction = Input.get_action_strength("ui_right") - Input.get_action_strength(("ui_left"))
	velocity.x = direction * speed

	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = jump_velocity
	
	velocity.y += 500 * delta # Gravity
	move_and_slide()  

func die():
	print("PLAYER DIED")
	if not is_alive:
		return
	is_alive = false
	#$Sprite.modulate = Color(1, 0, 0) # Change color to red
	get_tree().call_group("swap_logic", "on_player_death", global_position)


func _on_death_zone_2_body_entered(body: Node2D) -> void:
	if body == self:
		die()
