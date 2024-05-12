extends PlayerState

func enter(_data = null) -> void:
	animation_player.play(name)


func physics_process(delta: float) -> void:
	if not player.is_on_floor():
		switch.emit(name, "Coyote", null)
		return
	if input.jump_pressed:
		switch.emit(name, "Jump", null)
		return

	if input.movement_axis == 0:
		if abs(player.velocity.x) < 1:
			player.velocity.x = 0
			switch.emit(name, "Idle", null)
			return
		else:
			_decelerate(delta)
	else:
		_accelerate(delta)


func _decelerate(delta: float) -> void:
	player.velocity.x = lerpf(player.velocity.x, 0, player.DECELERATION_FLOOR * delta)


func _accelerate(delta: float) -> void:
	sprite.flip_h = input.movement_axis > 0
	player.velocity.x = lerpf(player.velocity.x, input.movement_axis * player.MAX_SPEED, player.ACCELERATION_FLOOR * delta)
