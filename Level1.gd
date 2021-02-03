extends Spatial

var speed = 4

func _ready():
	pass

func get_input(delta):	
	if Input.is_action_pressed("ui_left"):
		$Ship.translate(transform.basis.x * speed * delta)
		
	if Input.is_action_pressed("ui_right"):
		$Ship.translate(-1 * transform.basis.x * speed * delta)

	if Input.is_action_pressed("ui_up"):
		$Ship.translate(transform.basis.y * speed * delta)
		
	if Input.is_action_pressed("ui_down"):
		$Ship.translate(-1 * transform.basis.y * speed * delta)

func _physics_process(delta):
	get_input(delta)
	$Ship.translate(transform.basis.z * delta * speed)
	
	print($Ship.rotation)
