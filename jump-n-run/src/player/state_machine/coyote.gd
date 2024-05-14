extends PlayerState

@export var air: Node

var _timer: SceneTreeTimer

func enter(from: String) -> void:
	air.enter(from)
	_timer = get_tree().create_timer(player.COYOTE_TIME)
	_timer.timeout.connect(_timer_ended)


func _timer_ended() -> void:
	switch.emit(name, "Air")


func exit(to: String) -> void:
	air.exit(to)
	if _timer:
		_timer.timeout.disconnect(_timer_ended)
		_timer = null


func physics_process(delta: float) -> void:
	air.physics_process(delta)
	if input.jump_pressed:
		switch.emit(name, "Jump")
