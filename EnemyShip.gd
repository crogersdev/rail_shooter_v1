extends CharacterBody3D

@export var move_speed_z = 5.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_velocity(Vector3(0.0, 0.0, move_speed_z))
	move_and_slide()

# Fires whenever the $Area node emits the "body_entered" signal
func _on_Area_body_entered(body):
	if (body.is_in_group("player_bullets")):
		$CPUParticles3D.emitting = true
		
		# Wait a second to let the particles emit before deleting the object
		# but hide and disable the mesh and collisions while the timer is running
		$MeshInstance3D.hide()
		$Area3D/CollisionShape3D.disabled = true
		
		await get_tree().create_timer(1.0).timeout
		
		# TODO: Health
		queue_free()
