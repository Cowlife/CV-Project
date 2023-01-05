extends "res://entities/Entity.gd"

onready var value = $Spatial/MeshInstance.get_surface_material(0)
# Declare member variables here. Examples:
onready var a = value.flags_use_point_size
onready var b = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_Timer_timeout():
	b = not b
	value.set_flag(5, b) # Replace with function body.
