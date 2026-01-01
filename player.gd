extends CharacterBody2D

@export var speed: float = 200.0
@export var player_id: String = "green" # "green" or "white"

var gems_collected: int = 0
var finished: bool = false

func _physics_process(delta):
	if finished:
		velocity = Vector2.ZERO
		return

	var dir := Vector2.ZERO

	if player_id == "green":
		dir.x = Input.get_action_strength("green_right") - Input.get_action_strength("green_left")
		dir.y = Input.get_action_strength("green_down") - Input.get_action_strength("green_up")
	else:
		dir.x = Input.get_action_strength("white_right") - Input.get_action_strength("white_left")
		dir.y = Input.get_action_strength("white_down") - Input.get_action_strength("white_up")

	velocity = dir.normalized() * speed
	move_and_slide()

func collect_gem():
	gems_collected += 1
