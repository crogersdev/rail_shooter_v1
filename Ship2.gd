extends KinematicBody

var speed = 4
var rotation_speed = 1.5


func reset_ship_rotation(delta):
	pass

func get_input(delta):	
	var rotation = get_rotation()

	if Input.is_action_pressed("ui_left"):
		rotation.z = clamp(rotation.z + speed, 0.2, -0.2)
		set_rotation(rotation)
		
	if Input.is_action_pressed("ui_right"):
		rotation.z = clamp(rotation.z + speed, -0.2, 0.2)
		set_rotation(rotation)

	if Input.is_action_pressed("ui_up"):
		rotation.x = clamp(rotation.x + speed, 0.2, -0.2)
		set_rotation(rotation)
		
	if Input.is_action_pressed("ui_down"):
		rotation.x = clamp(rotation.x + speed, -0.2, 0.2)
		set_rotation(rotation)

func _physics_process(delta):
	#pass
	get_input(delta)
