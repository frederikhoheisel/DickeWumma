extends CanvasLayer


var paused: bool = false


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		paused = not paused
		get_tree().paused = paused
		self.visible = paused
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE if paused else Input.MOUSE_MODE_CAPTURED)


func _on_continue_button_pressed() -> void:
	paused = false
	get_tree().paused = false
	self.visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _on_restart_button_pressed() -> void:
	paused = false
	get_tree().paused = false
	self.visible = false
	get_tree().reload_current_scene()


func _on_exit_button_pressed() -> void:
	get_tree().quit()
