extends Spatial

onready var target = $Path/Dolly/Target
onready var ship = $Path/Dolly/Ship
onready var dolly = $Path/Dolly
onready var camera = $Path/Dolly/Camera

var dolly_speed = 5
var strafe_speed = 20
var ship_rotation_slerp_speed = 0.4
var straighten_out_speed = 0.05

var turning_left = false
var turning_right = false

func _physics_process(delta):
	dolly.offset += delta * dolly_speed
	get_input(delta)
	move_ship(delta)
	move_camera()

func get_input(delta):
	var velocity = Vector3()
	if Input.is_action_pressed("ui_up"):
		target.transform.origin.y += strafe_speed * delta

	if Input.is_action_pressed("ui_down"):
		target.transform.origin.y -= strafe_speed * delta

	if Input.is_action_pressed("ui_right"):
		target.transform.origin.x += delta * strafe_speed
		turning_right = true
	else:
		turning_right = false

	if Input.is_action_pressed("ui_left"):
		target.transform.origin.x -= delta * strafe_speed
		turning_left = true
	else:
		turning_left = false
		
	# straighten us out
	if !turning_left and !turning_right:
		target.transform.origin.x = lerp(
			target.transform.origin.x,
			ship.transform.origin.x,
			straighten_out_speed
		)
		target.transform.origin.y = lerp(
			target.transform.origin.y,
			ship.transform.origin.y,
			straighten_out_speed
		)

	target.transform.origin.y = clamp(target.transform.origin.y, 0, 6.0)
	target.transform.origin.x = clamp(target.transform.origin.x, -7.0, 7.0)

func move_ship(delta):
	var desired_rotation = ship.transform.looking_at(target.transform.origin, Vector3(0, 1, 0))
	var rotation = Quat(
		ship.transform.basis.get_rotation_quat()
	).slerp(
		desired_rotation.basis.get_rotation_quat(),
		ship_rotation_slerp_speed
	)

	var velocity = (
		target.transform.origin + Vector3(00, 00, dolly_speed)
	) - ship.transform.origin

	velocity = ship.move_and_slide(velocity, Vector3(0, 1, 0))
	ship.transform.origin.y = clamp(ship.transform.origin.y, -7.0, 7.0)
	ship.transform.origin.x = clamp(ship.transform.origin.x, -10.0, 10.0)
	ship.set_transform(Transform(rotation, ship.transform.origin))

func move_camera():
	# move the camera via lerp to ship position + vector3, where vector3 represents
	# an offset.  moving 'forward' in the level is a +Z movement, so we want to stay
	# behind the ship...  which means we stay -5 behind :D
	# todo: make it configurable and not hardcoded
	var orig = lerp(camera.transform.origin, ship.transform.origin + Vector3(0, 1, 5), 0.04)
	orig.x = clamp(orig.x, -50.0, 50.0)
	orig.y = clamp(orig.y, -30.0, 30.0)
	camera.transform.origin = orig
