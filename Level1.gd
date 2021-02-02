extends Spatial

func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	var speed = 4
	$Ship.translate(transform.basis.z * delta * speed)
	
	print($Ship.rotation)
