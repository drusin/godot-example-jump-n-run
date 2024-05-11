class_name Player
extends CharacterBody2D

const ACCELERATION_FLOOR := 5.0
const DECELERATION_FLOOR := 10.0
const ACCELERATION_AIR := 1.0
const MAX_SPEED := 150.0
const JUMP_VELOCITY := -400.0
const COYOTE_TIME := 0.1


func _physics_process(_delta: float) -> void:
	velocity.x = min(velocity.x, MAX_SPEED)
	move_and_slide()
