extends PlayerState


func process(_delta: float) -> void:
	player.velocity.y = player.JUMP_VELOCITY
	switch.emit(name, "Air")
