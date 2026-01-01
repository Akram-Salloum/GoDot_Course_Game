extends Area2D

@export var target_player: String = "green" # "green" or "white"

func _on_body_entered(body):
	if body.has_variable("player_id") == false:
		return

	if body.player_id == target_player and not body.finished:
		body.finished = true
		GameManager.player_finished(body)
