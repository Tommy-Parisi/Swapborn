extends "BaseNPC.gd"

@export var patrol_parent_path: NodePath = "PatrolPoints"
@export var wait_time_at_point: float = 0.2
@export var patrol_speed: float = 200.0

var _current_patrol_index: int = 0
var _waiting: bool = false
var _wait_timer: float = 0.0
var patrol_points: Array[Vector2] = []

func _ready():
	# Load patrol points from children
	var patrol_parent = get_node_or_null(patrol_parent_path)
	if patrol_parent:
		for child in patrol_parent.get_children():
			if child is Marker2D:
				patrol_points.append(child.global_position)
	print("Patrol points loaded: ", patrol_points)

func _physics_process(delta):
	if not is_alive:
		return

	if is_controlled:
		super._physics_process(delta) # Player control
	else:
		handle_patrol(delta)

	update_animation()

func handle_patrol(delta):
	if patrol_points.is_empty():
		return

	var target = patrol_points[_current_patrol_index]
	var direction = (target - global_position).normalized()
	var distance = global_position.distance_to(target)

	velocity.y += 500 * delta # Gravity

	if distance < 30.0:
		global_position.x = target.x
		global_position.y = target.y
		velocity = Vector2.ZERO

		if not _waiting:
			_waiting = true
			_wait_timer = wait_time_at_point
			print("Reached patrol point", _current_patrol_index)

		_wait_timer -= delta
		if _wait_timer <= 0.0:
			_waiting = false
			_current_patrol_index = (_current_patrol_index + 1) % patrol_points.size()
			print("Moving to next patrol point:", _current_patrol_index)
	else:
		velocity.x = direction.x * patrol_speed

	move_and_slide()

func update_animation():
	# Flip and animate based on velocity
	if velocity.x != 0:
		anim.flip_h = velocity.x < 0
		if anim.animation != "walk":
			anim.play("walk")
	else:
		if anim.animation != "idle":
			anim.play("idle")
