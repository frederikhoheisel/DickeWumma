extends CanvasLayer


var score: int = 0


@onready var score_label: Label = %ScoreLabel


func update_score() -> void:
	score += 1
	score_label.text = "SCORE: %d" %score
