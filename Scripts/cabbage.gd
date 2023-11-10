extends Node3D

var cabbage_state: int = 0
var ready_for_plate: bool = false

func change_state():
	cabbage_state += 1
	if cabbage_state == 1:
		$Lettuce.hide()
		$"Lettuce slice_flat".show()
		ready_for_plate = true
