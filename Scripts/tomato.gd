extends Node3D

var tomato_state: int = 0
var ready_for_plate: bool = false

func change_state():
	tomato_state += 1
	if tomato_state == 1:
		$Tomato_mesh.hide()
		$"Tomato slice".show()
		ready_for_plate = true
