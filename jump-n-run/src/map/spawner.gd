class_name Spawner
extends Node2D

@export var to_spawn: PackedScene
@export var spawn_to: Node2D

func spawn() -> Node2D:
    var spawned: Node2D = to_spawn.instantiate()
    spawned.position.x = position.x
    spawned.position.y = position.y
    spawn_to.add_child.call_deferred(spawned)
    return spawned