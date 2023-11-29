extends Control


func initialize(recipes_dictionary_key):
	var recipe_resources = RecipeManager.recipes_dictionary[recipes_dictionary_key]
	$Label.text = recipes_dictionary_key
	for resource in recipe_resources:
		var texture_slot = get_texture_slot()
		match  resource:
			"Bread":
				texture_slot.texture = load("res://Assets/Textures/Icons/Bread.png")
			"Cabbage":
				texture_slot.texture = load("res://Assets/Textures/Icons/CabbageSlices.png")
			"Cheese":
				texture_slot.texture = load("res://Assets/Textures/Icons/CheeseSlice.png")
			"Meat":
				texture_slot.texture = load("res://Assets/Textures/Icons/MeatPattyCooked.png")
			"Tomato":
				texture_slot.texture = load("res://Assets/Textures/Icons/TomatoSlice.png")

func get_texture_slot():
	if $"Plate items/TextureRect1".texture == null:
		return $"Plate items/TextureRect1"
	elif $"Plate items/TextureRect2".texture == null:
		return $"Plate items/TextureRect2"
	elif $"Plate items/TextureRect3".texture == null:
		return $"Plate items/TextureRect3"
	elif $"Plate items/TextureRect4".texture == null:
		return $"Plate items/TextureRect4"
	elif $"Plate items/TextureRect5".texture == null:
		return $"Plate items/TextureRect5"
	return null

func get_order_name() -> String:
	return $Label.text
