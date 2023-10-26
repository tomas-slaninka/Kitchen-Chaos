extends Node3D

var meat_state: int = 0

func change_meat_state():
	meat_state += 1
	if meat_state == 1:
		$"Uncooked meat patty2".hide()
		$"burned meat patty".hide()
		$"Cooked meat patty2".show()
	elif meat_state == 2:
		$"Uncooked meat patty2".hide()
		$"burned meat patty".show()
		$"Cooked meat patty2".hide()
