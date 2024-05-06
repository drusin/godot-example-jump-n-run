extends PlayerState

func enter(_data = null) -> void:
	animation_player.play(name)


func physics_process(delta: float) -> void:
	if not player.is_on_floor():
		switch.emit(name, "Coyote", null)
		return
	if Input.is_action_just_pressed("ui_accept"):
		switch.emit(name, "Jump", null)
		return

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction == 0:
		if abs(player.velocity.x) < 1:
			player.velocity.x = 0
			switch.emit(name, "Idle", null)
			return
		else:
			_decelerate(delta)
	else:
		_accelerate(direction, delta)


func _decelerate(delta: float) -> void:
	player.velocity.x = lerpf(player.velocity.x, 0, player.DECELERATION_FLOOR * delta)


func _accelerate(direction: float, delta: float) -> void:
	sprite.flip_h = direction > 0
	player.velocity.x = lerpf(player.velocity.x, direction * player.MAX_SPEED, player.ACCELERATION_FLOOR * delta)
