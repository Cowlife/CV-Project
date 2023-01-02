extends KinematicBody


# Declare member variables here. Examples:
var speed = 2
var point = Vector3(52, 12, 0)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction
	
	if point.distance_to(transform.origin) > 0:
		direction = point - transform.origin
		direction = direction.normalized() * speed
	
	else:
		direction = point - transform.origin
	
	move_and_slide(direction)
