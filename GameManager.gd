extends Node
class_name GameManager

var green_time := 0.0
var white_time := 0.0

var green_done := false
var white_done := false
var game_over := false

func _process(delta):
	if game_over:
		return

	if not green_done:
		green_time += delta
	if not white_done:
		white_time += delta

func player_finished(player):
	if player.player_id == "green":
		green_done = true
	else:
		white_done = true

	if green_done and white_done:
		end_game()

func end_game():
	game_over = true
	UI.show_winner()
