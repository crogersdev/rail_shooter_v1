extends Node3D

@onready var target = $Path3D/Dolly/Target
@onready var ship = $Path3D/Dolly/Ship
@onready var dolly = $Path3D/Dolly
@onready var camera = $Path3D/Dolly/Camera3D

# export lets us change these in the Inspector
@export var dolly_speed = 10
@export var strafe_speed = 25
@export var ship_rotation_slerp_speed = .4
@export var camera_lerp_speed = 0.04

# todo: make this guy part of max rotation
@export var max_rotation_angle = deg_to_rad(30)

var turning_left = false
var turning_right = false

func _physics_process(delta):
	dolly.h_offset += delta * dolly_speed
	dolly.v_offset += delta * dolly_speed
	move_shooting_target(delta)
	move_ship()
	move_camera()

func move_shooting_target(delta):
	# var velocity = Vector3()
	if Input.is_action_pressed("ui_up"):
		target.transform.origin.y += strafe_speed * delta

	if Input.is_action_pressed("ui_down"):
		target.transform.origin.y -= strafe_speed * delta

	if Input.is_action_pressed("ui_right"):
		target.transform.origin.x += delta * strafe_speed

	if Input.is_action_pressed("ui_left"):
		target.transform.origin.x -= delta * strafe_speed

	target.transform.origin.y = clamp(target.transform.origin.y, 0, 9.0)
	target.transform.origin.x = clamp(target.transform.origin.x, -12.0, 12.0)

func move_ship():
	var desired_rotation = ship.transform.looking_at(target.transform.origin, Vector3(0, 1, 0))
	var new_rotation = Quaternion(
		ship.transform.basis.get_rotation_quaternion()
	).slerp(
		desired_rotation.basis.get_rotation_quaternion(),
		ship_rotation_slerp_speed
	)

	var velocity = (
		target.transform.origin + Vector3(00, 00, dolly_speed)
	) - ship.transform.origin

	ship.set_velocity(velocity * 2)
	ship.set_up_direction(Vector3(0, 1, 0))
	ship.move_and_slide()
	velocity = ship.velocity
	
	#if Input.is_action_pressed("ui_right"):
	#	rotation *= Quat(Vector3(0, 0, 1), -0.05)
		
	#if Input.is_action_pressed("ui_left"):
	#	rotation *= Quat(Vector3(0, 0, 1), 0.05)
	
	ship.transform.origin.y = clamp(ship.transform.origin.y, -7.0, 7.0)
	ship.transform.origin.x = clamp(ship.transform.origin.x, -10.0, 10.0)

	ship.set_transform(Transform3D(new_rotation, ship.transform.origin))

func move_camera():
	# move the camera via lerp to ship position + vector3, where vector3 represents
	# an offset.  moving 'forward' in the level is a +Z movement, so we want to stay
	# behind the ship...  which means we stay -5 behind :D
	# todo: make it configurable and not hardcoded
	var orig = lerp(
		camera.transform.origin,
		ship.transform.origin + Vector3(0, 2, 5),
		camera_lerp_speed
	)
	orig.x = clamp(orig.x, -50.0, 50.0)
	orig.y = clamp(orig.y, -30.0, 30.0)
	camera.transform.origin = orig
