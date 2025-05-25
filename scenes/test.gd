extends Node3D

@onready var cam = $"Camera3D"
@onready var car = $"TestCarBig"

var cam_offset = Vector3(0, 1.476, -3.286)

func _process(delta):
	cam.global_transform.origin = car.global_transform.origin
	cam.global_transform.origin += car.global_transform.basis * cam_offset
	cam.look_at(car.global_transform.origin, Vector3.UP)
