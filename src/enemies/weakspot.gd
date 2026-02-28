class_name WeakSpot
extends Area3D


signal hit(amount: float)


func take_damage(amount: int) -> void:
	hit.emit(amount * 2.0)
	self.queue_free()
