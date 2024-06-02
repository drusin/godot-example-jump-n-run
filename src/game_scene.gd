extends Node2D

@onready var player_spawner: Spawner = $PlayerSpawner
@onready var scene_camera: Camera2D = $SceneCamera


func _ready() -> void:
	spawn_player()


func spawn_player() -> void:
	var new_player: Player = player_spawner.spawn()
	var camera_transform: RemoteTransform2D = RemoteTransform2D.new()
	camera_transform.remote_path = scene_camera.get_path()
	new_player.add_child(camera_transform)


func _on_world_boundary_body_entered(body: Node2D) -> void:
	if not body is Player:
		return
	body.queue_free()
	spawn_player()

