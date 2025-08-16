extends RigidBody3D

@export var speed: float = 10.0
@export var turn_speed: float = 2.0

func _physics_process(delta):
	var direction = Vector3.ZERO

   
	if Input.is_action_pressed("ui_up"):
		direction.z -= 1
	elif Input.is_action_pressed("ui_down"):
		direction.z += 1

   
	if direction != Vector3.ZERO:
		var force = -transform.basis.z * speed * direction.z
		apply_central_force(force)

 
	if Input.is_action_pressed("ui_left"):
		apply_torque(Vector3.UP * -turn_speed)
	elif Input.is_action_pressed("ui_right"):
		apply_torque(Vector3.UP * turn_speed)
