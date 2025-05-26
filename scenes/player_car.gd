extends VehicleBody3D


func _physics_process(delta):
	steering = Input.get_axis("right", "left") * 0.2
	engine_force = Input.get_axis("back", "forward") * 256
	
	
	if Input.is_action_just_released("space"):
		position.y += 0.5
		rotation_degrees = Vector3(0,rotation_degrees.y,0)
