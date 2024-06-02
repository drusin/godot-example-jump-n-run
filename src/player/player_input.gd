class_name PlayerInput
extends Node

var movement_axis := 0.0
var jump_pressed: bool:
	get:
		return _jump_buffer.pressed()


enum _Controls {
	LEFT,
	RIGHT,
	JUMP
}

const _BUFFER_MS := 150

var _jump_buffer := _BufferedAction.new()
var _mapping := {}


func _init() -> void:
	_mapping[_Controls.LEFT] = "g_left"
	_mapping[_Controls.RIGHT] = "g_right"
	_mapping[_Controls.JUMP] = "g_jump"


func _process(_delta: float) -> void:
	movement_axis = Input.get_axis(_mapping[_Controls.LEFT], _mapping[_Controls.RIGHT])


func _unhandled_input(event: InputEvent) -> void:
	if not event.is_pressed():
		return
	if event.is_action_pressed(_mapping[_Controls.JUMP]):
		_jump_buffer.trigger()
		return


class _BufferedAction extends RefCounted: 
	var _last_timestamp := 0.0

	func pressed() -> bool:
		# "consume" the press on read, else double jump is triggered immediately if you hold the button for longer than a frame
		var timestamp := _last_timestamp
		_last_timestamp = 0.0 
		return Time.get_ticks_msec() - timestamp <= _BUFFER_MS


	func trigger() -> void:
		_last_timestamp = Time.get_ticks_msec()
