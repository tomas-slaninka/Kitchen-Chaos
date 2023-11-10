extends Timer

signal item_added(array_number: int)

func _on_timeout():
	var array_number = RecipeManager.add_order()
	if array_number > -1:
		item_added.emit(array_number)
