extends Sprite3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var delivered_item = get_parent().return_item()
	if delivered_item:
		if delivered_item.is_in_group("Plate"):
			var placed_items = delivered_item.get_placed_items()
			deliver_food(placed_items)

func deliver_food(placed_items):
	var item_not_found: bool 
	for order in RecipeManager.orders:
		var resources = RecipeManager.recipes_dictionary[order]
		if placed_items.size() != resources.size():
			continue
		item_not_found = false
		for placed_item in placed_items:
			if !resources.has(placed_item):
				item_not_found = true
			if item_not_found:
				break
		if !item_not_found:
			RecipeManager.deliver_order(order)
