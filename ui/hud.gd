extends CanvasLayer


var score: int = 0
var time_l: float = 0.0
var time_r: float = 0.0


@onready var score_label: Label = %ScoreLabel


func update_score() -> void:
	score += 1
	score_label.text = "SCORE: %d" %score


func end_game() -> void:
	$EndScreen.visible = true
	get_tree().paused = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _process(delta: float) -> void:
	time_l += delta
	time_r += delta
	%ProgL.value = time_l * 100.0
	%ProgR.value = time_r * 100.0


func right() -> void:
	time_r = 0.0


func left() -> void:
	time_l = 0.0
