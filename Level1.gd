extends Spatial

onready var ship = $Path/Dolly/Ship
onready var dolly = $Path/Dolly
onready var camera = $Path/Dolly/Camera

var dolly_speed = 1

var strafe_speed = 3
var turning_left = false
var turning_right = false

var z_rotation = 0.0
var max_z_rotation = 99.0
var barrel_roll = false
var barrel_roll_finished = 0.0

func _physics_process(delta):
	dolly.offset += delta * dolly_speed
	get_input(delta)
	#move_camera()
	
func _process(delta):
	var fps = Engine.get_frames_per_second()
	# var lerp_interval = 
	
func get_input(delta):
	if Input.is_action_pressed("ui_left"):
		ship.transform.origin.x += delta * strafe_speed
		
	if Input.is_action_pressed("ui_right"):
		ship.transform.origin.x -= delta * strafe_speed

	if Input.is_action_pressed("ui_up"):
		ship.translate(ship.transform.basis.y * delta)
		
	if Input.is_action_pressed("ui_down"):
		ship.translate(-1 * ship.transform.basis.y * delta)

func move_camera():
	var orig = lerp(
		camera.transform.origin,
		ship.transform.origin + Vector3(0, 1, 5),
		0.04
	)
	orig.x = clamp(orig.x, -50.0, 50.0)
	orig.y = clamp(orig.y, -30.0, 30.0)
	
	camera.transform.origin = orig
