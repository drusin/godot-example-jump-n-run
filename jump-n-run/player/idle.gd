extends PlayerState


func enter(_data = null) -> void:
	animation_player.play(name)


func process(_delta: float) -> void:
	if not Input.get_axis("ui_left", "ui_right") or not player.velocity.x == 0:
		switch.emit(name, "Running", null)
	if Input.is_action_just_pressed("ui_accept"):
		switch.emit(name, "Jumping", null)


func physics_process(_delta: float) -> void:
	if not player.is_on_floor():
		switch.emit(name, "Air", null)
