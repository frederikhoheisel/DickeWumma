extends Node3D

@export var damage: int = 1
var look_sensitivity: float = 0.001
var current_barrrel: int = 0
var shake_tween: Tween
@onready var barrel_left: MeshInstance3D = $Head/Camera3D/DickeWumma/BarrelLeft
@onready var barrel_right: MeshInstance3D = $Head/Camera3D/DickeWumma/BarrelRight
@onready var current_barrel: MeshInstance3D = barrel_left


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


func screenshake() -> void:
	if shake_tween:
		shake_tween.kill()
	shake_tween = get_tree().create_tween()
	shake_tween.set_parallel(false)
	var original_pos: Vector3 = $Head.position
	shake_tween.tween_property($Head, "position", original_pos + Vector3(0, 0, 0.1), 0.1)
	shake_tween.tween_property($Head, "position", original_pos, 0.1)
	

func shoot_dw() -> void:
	if current_barrel.can_shoot:
		# screenshake
		screenshake()
		if current_barrel == barrel_left:	
			# muzzle_flash & particles
			$AnimationPlayer.play("recoil_left")
			current_barrel.bumm()
			current_barrel = barrel_right
		elif current_barrel == barrel_right:
			# screenshake
			screenshake()
			# muzzle_flash & particles
			$AnimationPlayer.play("recoil_right")
			current_barrel.bumm()
			current_barrel = barrel_left
		
		%HitRayCast3D.force_raycast_update()
		if %HitRayCast3D.is_colliding():
			var collider = %HitRayCast3D.get_collider()
			
			if collider.has_method("take_damage"):
				print("player: raycast hit")
				collider.take_damage(damage)
