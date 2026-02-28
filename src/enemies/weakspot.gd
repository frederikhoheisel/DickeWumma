class_name WeakSpot
extends Area3D


signal hit(amount: float)


func take_damage(amount: int) -> void:
	print("weak")
	hit.emit(amount * 5.0)
	self.queue_free()
