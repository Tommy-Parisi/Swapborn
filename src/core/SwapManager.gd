extends Node2D

var npc_list := []

func _ready():
	add_to_group("swap_logic")
	npc_list = get_tree().get_nodes_in_group("npc")
	# Can call npc_list.clear() and repopulate on level start if needed

func on_player_death(player_position: Vector2):
	var closest_npc = null
	var min_dist = INF

	for npc in npc_list:
		var dist = player_position.distance_squared_to(npc.global_position)
		if dist < min_dist:
			min_dist = dist
			closest_npc = npc

	if closest_npc:
		start_swap_sequence(closest_npc)

func start_swap_sequence(npc):
	# Zoom out effect, then switch
	await camera_zoom_out(npc)
	for other in npc_list:
		if other.has_method("release_control"):
			other.release_control()

	npc.become_controlled()
	await camera_zoom_in(npc)

func camera_zoom_out(npc):
	var camera = npc.get_node("Camera2D")
	var start_zoom = camera.zoom
	var end_zoom = Vector2(2, 2)
	for i in range(10):
		camera.zoom = lerp(start_zoom, end_zoom, i / 10.0)
		await get_tree().create_timer(0.02).timeout

func camera_zoom_in(npc):
	var camera = npc.get_node("Camera2D")
	camera.global_position = npc.global_position
	var start_zoom = camera.zoom
	var end_zoom = Vector2(1, 1)
	for i in range(10):
		camera.zoom = lerp(start_zoom, end_zoom, i / 10.0)
		await get_tree().create_timer(0.02).timeout
