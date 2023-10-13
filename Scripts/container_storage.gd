extends StaticBody3D

@export var icon_name: String
@export var spawnable_object_name: String


func reset_albedo_color():
	$Counter.transparency = 0.0
	$Door.transparency = 0.0


func set_albedo_color():
	$Counter.transparency = 0.3
	$Door.transparency = 0.3


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func get_spawnable_object_name() -> String:
	return spawnable_object_name
