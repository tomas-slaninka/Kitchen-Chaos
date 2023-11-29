extends Marker3D


# Called when the node enters the scene tree for the first time.
func _ready():
	if get_parent().kitchen_item != null:
		var instance = get_parent().kitchen_item.instantiate()
		add_child(instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func place_item(item) -> bool:
	var child
	if get_child_count() > 0:
		child = get_child(0)
	if child == null:
		add_child(item)
		return true
	if child.is_in_group("Kitchen Item"):
		return child.place_item(item)
	else:
		# nothing, we already have a child
		return false

func return_item():
	if get_child_count() == 0:
		return
	var child = get_child(0)
	if child.is_in_group("Kitchen Item") and child.has_method("return_item"):
		return child.return_item()
	else:
		remove_child(child)
		return child

func cut_item():
	var child
	if get_child_count() > 0:
		child = get_child(0)
	else:
		return
	if child.is_in_group("Cutting"):
		child.cut_item()
