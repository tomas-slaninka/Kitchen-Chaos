extends CanvasLayer

var order = preload("res://Scenes/order.tscn")

func _ready():
	RecipeManager.order_removed.connect(_on_recipe_manager_order_removed)

func _physics_process(delta):
	$Label.text = str(RecipeManager.score)

func _on_recipe_spawner_item_added(array_number):
	var order_instance = order.instantiate()
	$GridContainer.add_child(order_instance)
	order_instance.initialize(RecipeManager.orders[array_number])

func _on_recipe_manager_order_removed(order):
	var done: bool = false
	for ordered in $GridContainer.get_children():
		if !done:
			if ordered.get_order_name() == order:
				ordered.queue_free()
				done = true
