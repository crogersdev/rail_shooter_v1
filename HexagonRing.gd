extends StaticBody3D

@export var rotate_speed = 5.0

var random_number_generator = RandomNumberGenerator.new()
var rotate_speed_offset


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	random_number_generator.randomize()
	rotate_speed_offset = random_number_generator.randf_range(-2.0, 2.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Constantly rotate around the Z axis
	# Add a random offset speed to rotation for variety
	global_rotate(Vector3.FORWARD, (rotate_speed + rotate_speed_offset) * delta)
