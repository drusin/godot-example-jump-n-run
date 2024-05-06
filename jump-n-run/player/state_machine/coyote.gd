extends PlayerState

@export var air: Node

var _timer: SceneTreeTimer

func enter(data = null) -> void:
    air.enter(data)
    _timer = get_tree().create_timer(player.COYOTE_TIME)
    _timer.timeout.connect(_timer_ended)


func _timer_ended() -> void:
    switch.emit(name, "Air", null)


func exit(data = null) -> void:
    air.exit(data)
    if _timer:
        _timer.timeout.disconnect(_timer_ended)
        _timer = null


func physics_process(delta: float) -> void:
    air.physics_process(delta)
	
    if Input.is_action_just_pressed("ui_accept"):
        switch.emit(name, "Jump", null)
