extends Node3D


func _ready() -> void:
	$Smoke.restart()
	$Shards.restart()
	$Blink.restart()
	
	await get_tree().create_timer(1.0).timeout
	
	self.queue_free()
