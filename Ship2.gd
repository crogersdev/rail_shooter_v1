extends KinematicBody

var speed = 4

var x_rotation_dampener = 10.5
var y_rotation_dampener = 10.5
var z_rotation_dampener = 10.5

func reset_ship_rotation(delta):
	pass

func get_input(delta):	

	if Input.is_action_pressed("ui_left"):
		rotate_z(-1 * delta * z_rotation_dampener)
		
	if Input.is_action_pressed("ui_right"):
		rotate_z(delta * z_rotation_dampener)

	if Input.is_action_pressed("ui_up"):
		rotate_x(-1 * delta * y_rotation_dampener)
		
	if Input.is_action_pressed("ui_down"):
		rotate_x(delta * y_rotation_dampener)

func _physics_process(delta):
	#pass
	get_input(delta)
