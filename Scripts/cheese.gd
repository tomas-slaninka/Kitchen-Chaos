extends Node3D

var cheese_state: int = 0
var ready_for_plate: bool = false

func change_state():
	cheese_state += 1
	if cheese_state == 1:
		$"cheese block".hide()
		$"cheese slice".show()
		ready_for_plate = true
