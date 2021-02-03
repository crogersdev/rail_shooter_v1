extends KinematicBody

var speed = 4

func get_input(delta):	

	if Input.is_action_pressed("ui_left"):
		rotate_z(delta * -.5)
		
	if Input.is_action_pressed("ui_right"):
		rotate_z(delta * .5)

	if Input.is_action_pressed("ui_up"):
		rotate_x(delta * -.75)
		
	if Input.is_action_pressed("ui_down"):
		rotate_x(delta * .75)

func _physics_process(delta):
	get_input(delta)
	
	# if translate stays in here, we move in the +z direction irrespective
	# of ship pitch, yaw, and roll
	#translate(transform.basis.z * speed * delta)
