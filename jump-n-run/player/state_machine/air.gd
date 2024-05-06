extends PlayerState


func enter(_data = null) -> void:
	animation_player.play(name)


func physics_process(delta: float) -> void:
	if player.is_on_floor():
		switch.emit(name, "Running", null)
		return
	player.velocity += player.get_gravity() * delta
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		sprite.flip_h = direction > 0
	player.velocity.x = lerpf(player.velocity.x, player.MAX_SPEED * direction, player.ACCELERATION_AIR * delta)
