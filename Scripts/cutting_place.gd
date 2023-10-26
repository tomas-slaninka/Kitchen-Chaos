extends Node3D

func place_item(item) -> bool:
	if self.is_in_group("Frying") and item.is_in_group("Frying") != true:
		return false
	elif get_child_count() == 4:
		$Timer.start()
	if $Marker3D.get_child_count() > 0:
		return false
	else:
		$Marker3D.add_child(item)
		return true

func return_item():
	if $Marker3D.get_child_count() == 0:
		return 
	else:
		var child = $Marker3D.get_child(0)
		$Marker3D.remove_child(child)
		return child
	


func _on_timer_timeout():
	$Marker3D.get_child(0).change_meat_state()
