class_name PlayerState
extends State

enum KEYS { LEFT, RIGHT, JUMP }

var player: CharacterBody2D
var animation_player: AnimationPlayer
var sprite: Sprite2D

var pressed: Array[InputBuffer.BufferedAction]
