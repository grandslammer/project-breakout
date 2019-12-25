extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var window = get_viewport_rect().size
	offset.x = window.x/2
	offset.y = window.y/2

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
