extends Sprite

onready var levelName = get_tree().get_current_scene().get_name()

# Called when the node enters the scene tree for the first time.
func _ready():
	playAnimation()
	
func playAnimation():
	get_tree().get_root().get_node(levelName+"/AnimationPlayer").play("Paddle Animation")
