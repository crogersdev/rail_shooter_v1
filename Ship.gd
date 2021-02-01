extends KinematicBody

var speed = 4

func get_input(delta):
	
	# rotate
	#
	
	if Input.is_action_pressed("rotate_x"):
		# this is mapped to 'q' in the project->project settings->input map
		print("rotate_x(delta)")
		rotate_x(delta)
		
	if Input.is_action_pressed("rotate_y"):
		# this is mapped to 'w' in the project->project settings->input map
		print("rotate_y(delta)")
		rotate_y(delta)
		
	if Input.is_action_pressed("rotate_z"):
		# this is mapped to 'e' in the project->project settings->input map
		print("rotate_z(delta)")
		rotate_z(delta)
		
	if Input.is_action_pressed("neg_rotate_x"):
		# this is mapped to 'a' in the project->project settings->input map
		print("neg_rotate_x(delta)")
		rotate_x(-1 * delta)
		
	if Input.is_action_pressed("neg_rotate_y"):
		# this is mapped to 's' in the project->project settings->input map
		print("neg_rotate_y(delta)")
		rotate_y(-1 * delta)
		
	if Input.is_action_pressed("neg_rotate_z"):
		# this is mapped to 'd' in the project->project settings->input map
		print("neg_rotate_z(delta)")
		rotate_z(-1 * delta)
	
	if Input.is_action_pressed("ui_left"):
		rotate_y(delta)
		
	if Input.is_action_pressed("ui_right"):
		rotate_y(-1* delta)
		
	if Input.is_action_pressed("ui_up"):
		translate(transform.basis.y * speed * delta)
		
	if Input.is_action_pressed("ui_down"):
		translate(-1 * transform.basis.y * speed * delta)
		

func _physics_process(delta):
	get_input(delta)
	translate(transform.basis.z * speed * delta)
