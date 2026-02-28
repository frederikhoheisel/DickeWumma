extends CanvasLayer


var score: int = 0


@onready var score_label: Label = %ScoreLabel


func update_score() -> void:
	score += 1
	score_label.text = "SCORE: %d" %score


func end_game() -> void:
	$EndScreen.visible = true
	get_tree().paused = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
