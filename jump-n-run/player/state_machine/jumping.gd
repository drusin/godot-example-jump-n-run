extends PlayerState


func physics_process(_delta: float) -> void:
	player.velocity.y = player.JUMP_VELOCITY
	switch.emit(name, "Air")
