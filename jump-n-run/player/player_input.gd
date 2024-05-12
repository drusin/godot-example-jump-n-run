class_name PlayerInput
extends Node

enum Controls {
	LEFT,
	RIGHT,
	JUMP
}

const BUFFER_MS := 150

var movement_axis := 0.0

var jump_pressed: bool:
	get:
		return _jump_buffer.pressed()
var _jump_buffer := BufferedAction.new()

var _mapping := {}

func _init() -> void:
	_mapping[Controls.LEFT] = "g_left"
	_mapping[Controls.RIGHT] = "g_right"
	_mapping[Controls.JUMP] = "g_jump"


func _process(_delta: float) -> void:
	movement_axis = Input.get_axis(_mapping[Controls.LEFT], _mapping[Controls.RIGHT])


func _unhandled_input(event: InputEvent) -> void:
	if not event.is_pressed():
		return
	if event.is_action_pressed(_mapping[Controls.JUMP]):
		_jump_buffer.trigger()
		return


class BufferedAction extends RefCounted: 
	var _last_timestamp := 0.0
	func pressed() -> bool: return Time.get_ticks_msec() - _last_timestamp <= BUFFER_MS
	func trigger() -> void:	_last_timestamp = Time.get_ticks_msec()
