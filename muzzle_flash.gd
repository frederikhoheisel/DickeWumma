extends Node3D

func effects() -> void:
	$Flash.restart()
	$Sparks.restart()
	$Smoke.restart()
	flash_light()


func flash_light() -> void:
	$OmniLight3D.visible = true
	await get_tree().create_timer(0.1).timeout
	$OmniLight3D.visible = false
