extends KinematicBody

var speed = 4
var x_rotation_speed = 5
var y_rotation_speed = 2.5
var z_rotation_speed = 2.5

func reset_ship_rotation(delta):
	pass

func get_input(delta):
	rotation = get_rotation()

	if Input.is_action_pressed("ui_right"):
		rotate_z(delta * z_rotation_speed)
		rotation = get_rotation()
		rotation.z = clamp(rotation.z, -.25, .25)
		set_rotation(rotation)
		return
		
		rotate_y(-delta * y_rotation_speed)
		rotation = get_rotation()
		rotation.y = clamp(rotation.y, -.25, .25)
		set_rotation(rotation)
		
	if Input.is_action_pressed("ui_left"):
		rotate_z(-delta * z_rotation_speed)
		rotation = get_rotation()
		rotation.z = clamp(rotation.z, -.25, .25)
		set_rotation(rotation)
		return
		
		rotate_y(delta * y_rotation_speed)
		rotation = get_rotation()
		rotation.y = clamp(rotation.y, -.25, .25)
		set_rotation(rotation)

	if Input.is_action_pressed("ui_up"):
		rotate_x(-delta * x_rotation_speed)
		rotation = get_rotation()
		rotation.x = clamp(rotation.x, -.5, .5)
		set_rotation(rotation)
		
	if Input.is_action_pressed("ui_down"):
		rotate_x(delta * x_rotation_speed)
		rotation = get_rotation()
		rotation.x = clamp(rotation.x, -.5, .5)
		set_rotation(rotation)

func _physics_process(delta):
	#pass
	get_input(delta)
