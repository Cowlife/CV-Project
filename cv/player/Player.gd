extends KinematicBody

var gravity = -9.8
var velocity = Vector3.ZERO
var camera
var character 
const SPEED = 8
const ACCELERATION = 3
const DE_ACCELERATION = 5

func _ready():
	character = get_node(".")

func _physics_process(delta):
	var is_moving = false
	camera = get_node("Target/Camera").get_global_transform()
	var dir = Vector3.ZERO
	
	if(Input.is_action_pressed("move_forward")):
		dir += -camera.basis[2]
		is_moving = true
	if(Input.is_action_pressed("move_back")):
		dir += camera.basis[2]
		is_moving = true
	if(Input.is_action_pressed("move_left")):
		dir += -camera.basis[0]
		is_moving = true
	if(Input.is_action_pressed("move_right")):
		dir += camera.basis[0]
		is_moving = true
		
	dir.y = 0
	dir = dir.normalized()
	
	velocity.y += delta * gravity
	var hv = velocity
	hv.y = 0
	var new_pos = dir * SPEED
	var accel = DE_ACCELERATION
	
	if (dir.dot(hv) > 0):
		accel = ACCELERATION
	
	hv = hv.linear_interpolate(new_pos, accel * delta)
	velocity.x = hv.x
	velocity.z = hv.z
	
	velocity = move_and_slide(velocity, Vector3(0,1,0))
	
	if is_moving:
		var angle = atan2(hv.x, hv.z)
		var char_rot = character.get_rotation()
		char_rot.y = angle
		character.set_rotation(char_rot)
	
	var speed = hv.length() / SPEED

