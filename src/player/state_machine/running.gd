extends PlayerState

func enter(_from: String) -> void:
	animation_player.play(name)


func process(delta: float) -> void:
	if input.jump_pressed:
		switch.emit(name, "Jump")
		return

	if input.movement_axis == 0:
		if abs(player.velocity.x) < 1:
			player.velocity.x = 0
			switch.emit(name, "Idle")
		else:
			_decelerate(delta)
	else:
		_accelerate(delta)


func physics_process(_delta: float) -> void:
	if not player.is_on_floor():
		switch.emit(name, "Coyote")


func _decelerate(delta: float) -> void:
	player.velocity.x = lerpf(player.velocity.x, 0, player.DECELERATION_FLOOR * delta)


func _accelerate(delta: float) -> void:
	sprite.flip_h = input.movement_axis > 0
	player.velocity.x = lerpf(player.velocity.x, input.movement_axis * player.MAX_SPEED, player.ACCELERATION_FLOOR * delta)
