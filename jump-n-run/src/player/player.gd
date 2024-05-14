class_name Player
extends CharacterBody2D

enum Powerup {
	DOUBLE_JUMP,
}

const ACCELERATION_FLOOR := 5.0
const DECELERATION_FLOOR := 10.0
const ACCELERATION_AIR := 1.0
const MAX_SPEED := 150.0
const JUMP_VELOCITY := -400.0
const COYOTE_TIME := 0.1

var powerups: Array[bool] = []

@onready var _head: Area2D = $Head


func _init() -> void:
	for i in range(0, Powerup.size()):
		powerups.append(false)


func _physics_process(_delta: float) -> void:
	velocity.x = min(velocity.x, MAX_SPEED)
	move_and_slide()


func power_up(powerup: Powerup) -> void:
	powerups[powerup] = true


func _on_head_body_entered(body: Node2D) -> void:
	if not body is TileMapLayer:
		return
	var layer := body as TileMapLayer
	var coords := layer.local_to_map(_head.global_position)
	layer.erase_cell(Vector2i(coords.x, coords.y - 1))
