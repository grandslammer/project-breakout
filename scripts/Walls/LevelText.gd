extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	updateScore()

func updateScore():
	var levelName = get_tree().get_current_scene().get_name()
	text = "LVL: " + str(levelName[5])
	