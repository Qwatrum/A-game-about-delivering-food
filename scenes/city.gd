extends Node3D

@onready var cam = $"Camera3D"
@onready var car = $"TestCarBig"
@onready var map_node = $"Map"

@onready var street_1 = preload("res://scenes/street_1.tscn")

var symbol_to_path = {"-": preload("res://scenes/street_1.tscn")}

var map = [3,3,
	["-", 0],["-", 0],["-", 0],["-", 0],["-", 0],["-", 0],["-", 0],["-", 0],["-", 0]
]

var cam_offset = Vector3(0, 1.476, -3.286)


func _ready():
	build_world()

func _process(delta):
	cam.global_transform.origin = car.global_transform.origin
	cam.global_transform.origin += car.global_transform.basis * cam_offset
	cam.look_at(car.global_transform.origin, Vector3.UP)


func build_world():
	var x = 0
	var z = 0
	
	var i_x = 0
	var i_z = 0
	var build_map = map.duplicate()
	build_map.remove_at(0)
	build_map.remove_at(0)
	
	for e in build_map:
		var new_element = symbol_to_path[e[0]].instantiate()
		map_node.add_child(new_element)
		new_element.position = Vector3(x, 0, z)
		
		i_x += 1
		i_z += 1
		x += 4
		
		if i_x == map[0]:
			i_x = 0
			x = 0
		if i_z == map[1]:
			i_z = 0
			z += 4
		
		
