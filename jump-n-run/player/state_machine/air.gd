extends PlayerState


func enter(_data = null) -> void:
	animation_player.play(name)


func physics_process(delta: float) -> void:
	if player.is_on_floor():
		switch.emit(name, "Running", null)
		return
	player.velocity += player.get_gravity() * delta
	if input.movement_axis != 0:
		sprite.flip_h = input.movement_axis > 0
	player.velocity.x = lerpf(player.velocity.x, player.MAX_SPEED * input.movement_axis, player.ACCELERATION_AIR * delta)
