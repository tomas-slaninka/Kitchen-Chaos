extends CharacterBody3D


const SPEED = 5.0

@onready var tomato = preload("res://Scenes/tomato.tscn")
@onready var cheese = preload("res://Scenes/cheese.tscn")
@onready var bread = preload("res://Scenes/bread.tscn")
@onready var meat = preload("res://Scenes/meat.tscn")
@onready var cabbage = preload("res://Scenes/cabbage.tscn")
@onready var plate = preload("res://Scenes/plate.tscn")

var rotation_direction: float
var lastTarget


func _unhandled_input(event):
	pass

func _physics_process(delta):

	var input_dir: Vector2
	input_dir.x = Input.get_axis("move_right_" + self.name, "move_left_" + self.name)
	input_dir.y = Input.get_axis("move_down_" + self.name, "move_up_" + self.name)
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		$MeshInstance3D.rotation.y = atan2(velocity.x, velocity.z)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	
	handle_interact()
	
func handle_interact():
	var result = $MeshInstance3D/RayCast3D.get_collider()
	if not result:
		if lastTarget != null:
			lastTarget.reset_albedo_color()
			lastTarget = null
		return
	var target = result
	if target and target.has_method(("set_albedo_color")):
		if lastTarget != target:
			if lastTarget != null:
				lastTarget.reset_albedo_color()
			target.set_albedo_color()
			lastTarget = target

	var spawnable_type
	var interacts = Input.is_action_just_pressed("interact_" + self.name)
	var cuts = Input.is_action_just_pressed("cut_" + self.name)
	if interacts or cuts:
		if target:
			if $MeshInstance3D/Marker3D.get_child_count() == 1:
				if interacts and target.has_method("place_item"):
					var item = $MeshInstance3D/Marker3D.get_child(0)
					$MeshInstance3D/Marker3D.remove_child(item)
					var was_placed = target.place_item(item)
					if was_placed != true:
						$MeshInstance3D/Marker3D.add_child(item)
					return
			elif cuts and target.has_method("cut_item"):
				target.cut_item()
				return
			elif target.is_in_group("Spawnable_object") and interacts:
				spawnable_type = target.get_spawnable_object_name()
				spawn_object(spawnable_type)
			elif target.is_in_group("Placeable_cont") and interacts:
				$MeshInstance3D/Marker3D.add_child(target.return_item())


func spawn_object(spawnable_type):
	var inst
	match spawnable_type:
		"Tomato": 
			inst = tomato.instantiate()
			$MeshInstance3D/Marker3D.add_child(inst)
		"Bread": 
			inst = bread.instantiate()
			$MeshInstance3D/Marker3D.add_child(inst)
		"Cabbage": 
			inst = cabbage.instantiate()
			$MeshInstance3D/Marker3D.add_child(inst)
		"Meat": 
			inst = meat.instantiate()
			$MeshInstance3D/Marker3D.add_child(inst)
		"Cheese": 
			inst = cheese.instantiate()
			$MeshInstance3D/Marker3D.add_child(inst)
		"Plate": 
			inst = plate.instantiate()
			$MeshInstance3D/Marker3D.add_child(inst)
