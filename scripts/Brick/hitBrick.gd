extends KinematicBody2D

var maxBrickHealth = 1
var currentBrickHealth = 1
var brickColors
var brickScore

signal brickDestroyed

func HitBrick(ballDamage):
	currentBrickHealth = currentBrickHealth - ballDamage
	if currentBrickHealth <= 0:
		emit_signal("brickDestroyed",brickScore)
		#print("Emitted")
		self.queue_free()
	else:
		var brickSprite = get_node("Sprite")
		updateColor(brickSprite)
		#updateText()

func _ready():
	currentBrickHealth = maxBrickHealth
	var brickSprite = get_node("Sprite")
	brickScore = maxBrickHealth
	updateColor(brickSprite)
	#updateText()

func updateText():
	var brickSprite = get_node("Sprite")
	var spriteText = brickSprite.get_child(0)
	spriteText.text = str(currentBrickHealth)
	updateColor(brickSprite)
	
func updateColor(brickSprite):
	for i in range(brickColors.size()):
		var noBricks = i+1
		match currentBrickHealth:
			noBricks:
				brickSprite.texture = brickColors[i]