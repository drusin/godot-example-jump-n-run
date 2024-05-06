class_name State
extends Node

signal switch(from: String, to: String, data)


func physics_process(_delta: float) -> void:
	pass


func process(_delta: float) -> void:
	pass


func enter(_data = null) -> void:
	# get rid of the stupid unused warning...
	switch.is_null()


func exit(_data = null) -> void:
	pass
