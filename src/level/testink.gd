extends Node3D

func _ready() -> void:
	get_tree().paused = true
	await get_tree().create_timer(4.0).timeout
	$Hud.hide_intro()
	get_tree().paused = false
