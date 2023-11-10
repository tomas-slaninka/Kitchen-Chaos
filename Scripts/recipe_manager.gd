extends Node

var order_number: int = 0
var max_orders: int = 4


var recipes_dictionary = {
	"Basic burger": ["Bread", "Meat"],
	"Cheese burger": ["Bread", "Meat", "Cheese"],
	"Tomato burger": ["Bread", "Meat", "Tomato"],
	"Salad burger": ["Bread", "Meat", "Salad"],
	"Salad and tomato burger": ["Bread", "Meat", "Salad", "Tomato"],
	"Cheese and tomato burger": ["Bread", "Meat", "Cheese", "Tomato"],
	"Cheese and salad burger": ["Bread", "Meat", "Cheese", "Salad"],
	"Vegan burger": ["Bread", "Cheese", "Salad", "Tomato"],
	"Mega burger": ["Bread", "Meat", "Cheese", "Salad", "Tomato"],
}

var orders = []

func add_order() -> int:
	var size = recipes_dictionary.size()
	if order_number >= max_orders:
		return -1
	var random_key = recipes_dictionary.keys()[randi() % size]
	orders.append(random_key)	
	order_number += 1
	
	return order_number-1
