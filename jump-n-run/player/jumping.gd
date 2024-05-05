extends PlayerState

const JUMP_VELOCITY = -400.0


func physics_process(_delta: float) -> void:
	player.velocity.y = JUMP_VELOCITY
	switch.emit(name, "Air", null)
