extends VehicleBody3D


func _physics_process(delta):
	steering = Input.get_axis("right", "left") * 0.2
	engine_force = Input.get_axis("back", "forward") * 60
