extends CanvasLayer

@onready var green_label: Label = $GreenTimer
@onready var white_label: Label = $WhiteTimer
@onready var winner_panel: Panel = $WinnerPanel
@onready var winner_label: Label = $WinnerPanel/WinnerLabel

func _ready():
	winner_panel.visible = false

func _process(delta):
	green_label.text = "Green Time: %.2f s" % GameManager.green_time
	white_label.text = "White Time: %.2f s" % GameManager.white_time

func show_winner():
	winner_panel.visible = true

	if GameManager.green_time < GameManager.white_time:
		winner_label.text = "🏆 GREEN PLAYER WINS!"
	elif GameManager.white_time < GameManager.green_time:
		winner_label.text = "🏆 WHITE PLAYER WINS!"
	else:
		winner_label.text = "🤝 DRAW!"
