extends Area2D

@export var powerup: Player.Powerup


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		(body as Player).power_up(powerup)
		visible = false
		await get_tree().create_timer(2).timeout
		visible = true