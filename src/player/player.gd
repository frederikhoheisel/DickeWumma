extends Node3D

@export var damage: int = 1
var look_sensitivity: float = 0.001


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			self.rotate_y(-event.relative.x * look_sensitivity)
			%Camera3D.rotate_x(-event.relative.y * look_sensitivity)
			%Camera3D.rotation.x = clamp(%Camera3D.rotation.x, deg_to_rad(-10), deg_to_rad(60))
			self.rotation.y = clamp(self.rotation.y, deg_to_rad(-90), deg_to_rad(90))

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		shoot_dw()


func shoot_dw() -> void:
	# screenshake
	# muzzle_flash & particles
	# bumm sound
	%HitRayCast3D.force_raycast_update()
	if %HitRayCast3D.is_colliding():
		var collider = %HitRayCast3D.get_collider()
		
		if collider.has_method("take_damage"):
			print("player: raycast hit")
			collider.take_damage(damage)


func _on_hitbox_body_entered(body: Node3D) -> void:
	print(body)
	if body is CharacterBody3D:
		get_tree().get_first_node_in_group("HUD").end_game()
