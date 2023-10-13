extends CharacterBody3D


const SPEED = 5.0

@onready var tomato = preload("res://Scenes/tomato.tscn")
@onready var cheese = preload("res://Scenes/cheese.tscn")
@onready var bread = preload("res://Scenes/bread.tscn")
@onready var meat = preload("res://Scenes/meat.tscn")
@onready var cabbage = preload("res://Scenes/cabbage.tscn")

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
	if Input.is_action_just_pressed("interact_" + self.name):
		if target:
			print(target)
			if target.is_in_group("Spawnable_object"):
				spawnable_type = target.get_spawnable_object_name()
	
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
	
