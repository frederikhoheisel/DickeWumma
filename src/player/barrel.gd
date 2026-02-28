extends MeshInstance3D

var can_shoot = true

func bumm() -> void:
	can_shoot = false
	$Cooldown.start()
	%MuzzleFlash.effects()
	# movement animation


func _on_cooldown_timeout() -> void:
	can_shoot = true
