extends Node3D

var meat_state: int = 0
var ready_for_plate: bool = false

func change_meat_state():
	meat_state += 1
	if meat_state == 1:
		$"Uncooked meat patty2".hide()
		$"burned meat patty".hide()
		$"Cooked meat patty2".show()
		ready_for_plate = true
	elif meat_state == 2:
		$"Uncooked meat patty2".hide()
		$"burned meat patty".show()
		$"Cooked meat patty2".hide()
		ready_for_plate = false
