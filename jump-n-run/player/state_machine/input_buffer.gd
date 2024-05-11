class_name InputBuffer
extends Node

const BUFFER_MS := 150
const MAPPING :=  {
    "ui_accept" = PlayerState.KEYS.JUMP
}

var pressed: Array[BufferedAction]

func _init() -> void:
    for key in PlayerState.KEYS.values():
        pressed.append(BufferedAction.new())


func _unhandled_input(event: InputEvent) -> void:
    if not event.is_pressed():
        return
    for key in MAPPING.keys():
        if event.is_action_pressed(key):
            pressed[MAPPING.get(key)].trigger()


class BufferedAction extends RefCounted: 
    var _last_timestamp := 0.0


    func consume() -> bool:
        return Time.get_ticks_msec() - _last_timestamp <= BUFFER_MS
    

    func trigger() -> void:
        _last_timestamp = Time.get_ticks_msec()
