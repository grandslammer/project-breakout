extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var arrowSize = self.texture.get_size()
	offset = Vector2(0,(-arrowSize.y/2))

func _physics_process(delta):
	look_at(Vector2(get_global_mouse_position().x,get_global_mouse_position().y))
	rotation_degrees += 90
	var mouseLocation = get_global_mouse_position().distance_to(position)/30
	scale.y = clamp(mouseLocation, 2, 7)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
