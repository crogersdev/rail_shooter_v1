extends KinematicBody

export var bullet_speed = 100.0

onready var Bullet = preload("res://Bullet.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_just_pressed("fire")):
		var new_bullet = Bullet.instance()
		
		new_bullet.add_to_group("player_bullets")
		
		# We want to spawn the bullet 2 units ahead of the ship
		var desired_bullet_pos = global_transform.origin + Vector3(0.0, 0.0, -2.0)
		
		# Move it from its current position to the desired position
		new_bullet.translate(desired_bullet_pos)
		
		# Use global_transform.basis.z to make sure the bullet fires in the ship's forward direction
		# global_transform.basis.z is the ship's backwards direction based on its current rotation
		new_bullet.linear_velocity = global_transform.basis.z * (bullet_speed * -1.0)
		
		get_tree().root.add_child(new_bullet)
		
		# Wait 1.0 seconds
		yield(get_tree().create_timer(1.0), "timeout")
		
		# Delete the bullet
		new_bullet.queue_free()
