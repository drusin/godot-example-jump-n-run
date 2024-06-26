extends Node

@export var player: CharacterBody2D
@export var animation_player: AnimationPlayer
@export var sprite: Sprite2D
@export var player_input: PlayerInput
@export var initial_state: State

var _states: Array[PlayerState] = []
var _current_state: PlayerState


func _ready() -> void:
	_current_state = initial_state
	for child: Node in get_children():
		if not child is PlayerState:
			continue
		var state: PlayerState = child
		_states.append(state)
		state.switch.connect(_switch)
		state.player = player
		state.animation_player = animation_player
		state.sprite = sprite
		state.input = player_input


func _switch(from: String, to: String) -> void:
	for child: PlayerState in _states:
		if child.name == from:
			child.exit(to)
		elif child.name == to:
			child.enter(from)
			_current_state = child
	print("moved from " + from + " to " + to)


func _process(delta: float) -> void:
	if (_current_state):
		_current_state.process(delta)


func _physics_process(delta: float) -> void:
	if (_current_state):
		_current_state.physics_process(delta)
