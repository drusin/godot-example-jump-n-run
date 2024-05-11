extends PlayerState


func enter(_data = null) -> void:
	animation_player.play(name)


func process(_delta: float) -> void:
	if not Input.get_axis("ui_left", "ui_right") == 0 or not player.velocity.x == 0:
		switch.emit(name, "Running", null)
	if pressed[KEYS.JUMP].consume():
		switch.emit(name, "Jump", null)


func physics_process(_delta: float) -> void:
	if not player.is_on_floor():
		switch.emit(name, "Coyote", null)
