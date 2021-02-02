extends KinematicBody

var speed = 4

func get_input(delta):	
	if Input.is_action_pressed("rotate_x"):
		# this is mapped to 'q' in the project->project settings->input map
		rotate_x(delta)
		
	if Input.is_action_pressed("rotate_y"):
		# this is mapped to 'w' in the project->project settings->input map
		rotate_y(delta)
		
	if Input.is_action_pressed("rotate_z"):
		# this is mapped to 'e' in the project->project settings->input map
		rotate_z(delta)
		
	if Input.is_action_pressed("neg_rotate_x"):
		# this is mapped to 'a' in the project->project settings->input map
		rotate_x(-1 * delta)
		
	if Input.is_action_pressed("neg_rotate_y"):
		# this is mapped to 's' in the project->project settings->input map
		rotate_y(-1 * delta)
		
	if Input.is_action_pressed("neg_rotate_z"):
		# this is mapped to 'd' in the project->project settings->input map
		rotate_z(-1 * delta)

################################################################################

	if Input.is_action_pressed("ui_left"):
		rotate_y(delta)
		
	if Input.is_action_pressed("ui_right"):
		rotate_y(-1* delta)

	if Input.is_action_pressed("ui_up"):
		translate(transform.basis.y * speed * delta)
		
	if Input.is_action_pressed("ui_down"):
		translate(-1 * transform.basis.y * speed * delta)
		
################################################################################
		
	if Input.is_action_pressed("translate_x"):
		# this is mapped to 'r' in the project->project settings->input map
		translate(transform.basis.x * speed * delta)
		
	if Input.is_action_pressed("translate_y"):
		# this is mapped to 't' in the project->project settings->input map
		translate(transform.basis.y * speed * delta)
		
	if Input.is_action_pressed("translate_z"):
		# this is mapped to 'y' in the project->project settings->input map
		translate(transform.basis.z * speed * delta)

	if Input.is_action_pressed("neg_translate_x"):
		# this is mapped to 'f' in the project->project settings->input map
		translate(-1 * transform.basis.x * speed * delta)
		
	if Input.is_action_pressed("neg_translate_y"):
		# this is mapped to 'g' in the project->project settings->input map
		translate(-1 * transform.basis.y * speed * delta)
		
	if Input.is_action_pressed("neg_translate_z"):
		# this is mapped to 'h' in the project->project settings->input map
		translate(-1 * transform.basis.z * speed * delta)

func _physics_process(delta):
	get_input(delta)
	#translate(transform.basis.z * speed * delta)
