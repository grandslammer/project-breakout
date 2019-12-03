extends KinematicBody2D

var maxBrickHealth = 1
var currentBrickHealth = 1

func HitBrick(ballDamage):
	currentBrickHealth = currentBrickHealth - ballDamage
	if currentBrickHealth <= 0:
		self.queue_free()
	else:
		var brickSprite = get_node("Sprite")
		var opacityChange = float(1)/maxBrickHealth
		print(maxBrickHealth)
		print(opacityChange)
		brickSprite.modulate = Color(1, 1, 1, (opacityChange*currentBrickHealth))
		updateText()

func _ready():
	currentBrickHealth = maxBrickHealth
	updateText()

func updateText():
	var brickSprite = get_node("Sprite")
	var spriteText = brickSprite.get_child(0)
	spriteText.text = str(currentBrickHealth)
	
