extends Node

var max_orders: int = 4
var score: int = 0

signal order_removed(order)


var recipes_dictionary = {
	"Basic burger": ["Bread", "Meat"],
	"Cheese burger": ["Bread", "Meat", "Cheese"],
	"Tomato burger": ["Bread", "Meat", "Tomato"],
	"Cabbage burger": ["Bread", "Meat", "Cabbage"],
	"Cabbage and tomato burger": ["Bread", "Meat", "Cabbage", "Tomato"],
	"Cheese and tomato burger": ["Bread", "Meat", "Cheese", "Tomato"],
	"Cheese and salad burger": ["Bread", "Meat", "Cheese", "Cabbage"],
	"Vegan burger": ["Bread", "Cheese", "Cabbage", "Tomato"],
	"Mega burger": ["Bread", "Meat", "Cheese", "Cabbage", "Tomato"],
}

var orders = []

func add_order() -> int:
	var size = recipes_dictionary.size()
	if orders.size() >= max_orders:
		return -1
	var random_key = recipes_dictionary.keys()[randi() % size]
	orders.append(random_key)
	
	return orders.size()-1

func deliver_order(order) -> void:
	var recipe_resources = recipes_dictionary[order]
	score += recipe_resources.size()
	orders.erase(order)
	order_removed.emit(order)
