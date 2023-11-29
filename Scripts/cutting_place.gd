extends Node3D

var has_item: bool
var cutting_progress: int

func _process(delta):
	if has_item and self.is_in_group("Frying"):
		var current_progress: float
		current_progress = ( $Timer.wait_time - $Timer.time_left ) / $Timer.wait_time
		current_progress *= 100
		$SubViewport/ProgressBar.value = current_progress
	elif has_item and self.is_in_group("Cutting"):
		$SubViewport/ProgressBar.value = cutting_progress


func place_item(item) -> bool:
	if self.is_in_group("Frying") and item.is_in_group("Frying") != true:
		return false
	elif self.is_in_group("Cutting") and item.is_in_group("Cutting") != true:
		return false

	if self.is_in_group("Frying"):
		$Timer.start()

	if $Marker3D.get_child_count() > 0:
		return false
	else:
		$Marker3D.add_child(item)
		cutting_progress = 0
		$Sprite3D.show()
		has_item = true
		return true


func return_item():
	if $Marker3D.get_child_count() == 0:
		return 
	else:
		var child = $Marker3D.get_child(0)
		$Marker3D.remove_child(child)
		$Sprite3D.hide()
		has_item = false
		if has_node("$Timer"):
			$Timer.stop()
		return child


func _on_timer_timeout():
	if $Marker3D.get_children():
		if $Marker3D.get_child(0):
			$Marker3D.get_child(0).change_meat_state()

func cut_item():
	if cutting_progress < 4:
		cutting_progress += 1
	if cutting_progress == 4:
		$Marker3D.get_child(0).change_state()
		
