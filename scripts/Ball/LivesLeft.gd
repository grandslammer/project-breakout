extends Sprite

onready var levelName = get_tree().get_current_scene().get_name()
export(Array, StreamTexture) var ballLifeSprites

func updateLives():
	var level = get_tree().get_root().get_node(levelName)
	match level.lives:
		2:
			texture = ballLifeSprites[2]
		1:
			texture = ballLifeSprites[1]
		0:
			texture = ballLifeSprites[0]
		_:
			texture = null