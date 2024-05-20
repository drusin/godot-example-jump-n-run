extends PlayerState

var _has_double_jumped := false


func enter(_from: String) -> void:
	animation_player.play(name)


func exit(to: String) -> void:
	_has_double_jumped = to == "Jump"


func process(delta: float) -> void:
	player.velocity += player.get_gravity() * delta

	if input.movement_axis != 0:
		sprite.flip_h = input.movement_axis > 0
	
	player.velocity.x = lerpf(player.velocity.x, player.MAX_SPEED * input.movement_axis, player.ACCELERATION_AIR * delta)

	if not _has_double_jumped and player.powerups[Player.Powerup.DOUBLE_JUMP]:
		if input.jump_pressed:
			switch.emit(name, "Jump")


func physics_process(_delta: float) -> void:
	if player.is_on_floor():
		switch.emit(name, "Running")
