extends DirectionalLight


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var light_source = get_node(".")
onready var timer = $Timer as Timer

# Called when the node enters the scene tree for the first time.

func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	light_source.rotate_x(0.001)
