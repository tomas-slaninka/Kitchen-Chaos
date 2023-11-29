extends Node3D

var placed_items = []

func place_item(item) -> bool:
	if -1 != placed_items.find(item.name):
		return false
	elif item.ready_for_plate != true:
		return false
	var texture_slot = get_next_free_sprite3d()
	if texture_slot:
		display_texture(texture_slot, item.name)
		placed_items.append(item.name)
		return true
	else:
		return false

func get_next_free_sprite3d() -> Sprite3D:
	if $Node3D/Sprite3D.texture == null:
		return $Node3D/Sprite3D
	elif $Node3D/Sprite3D2.texture == null:
		return $Node3D/Sprite3D2
	elif $Node3D/Sprite3D3.texture == null:
		return $Node3D/Sprite3D3
	elif $Node3D/Sprite3D4.texture == null:
		return $Node3D/Sprite3D4
	elif $Node3D/Sprite3D5.texture == null:
		return $Node3D/Sprite3D5
	return null

func display_texture(texture_slot, item_name) -> void:
	match item_name:
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

func get_placed_items():
	return placed_items
