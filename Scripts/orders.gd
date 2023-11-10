extends CanvasLayer

var order = preload("res://Scenes/order.tscn")


func _on_recipe_spawner_item_added(array_number):
	var order_instance = order.instantiate()
	$GridContainer.add_child(order_instance)
	order_instance.initialize(RecipeManager.orders[array_number])
