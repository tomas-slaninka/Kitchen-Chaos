extends StaticBody3D

@export var kitchen_item: PackedScene

func reset_albedo_color():
	$Cube_001.transparency = 0.0


func set_albedo_color():
	$Cube_001.transparency = 0.3

func place_item(item):
	$Container_Full_Marker.place_item(item)
	

func return_item():
	return $Container_Full_Marker.return_item()

func process_item():
	pass
