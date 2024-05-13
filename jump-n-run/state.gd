class_name State
extends Node

## Generic state to use in a state machine

## Should be emited if the state wants to switch to a different state [br]
##
## [param from]: current state name [br]
## [param to]: state to switch to [br]
@warning_ignore("unused_signal")
signal switch(from: String, to: String)


func physics_process(_delta: float) -> void:
	pass


func process(_delta: float) -> void:
	pass


## Will be called when the state becomes active
func enter(_from: String) -> void:
	pass


## Will be called when the state becomes inactive
func exit(_to: String) -> void:
	pass
