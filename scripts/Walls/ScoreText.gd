extends Label

var score = 0
var scoreDisplay = "%08d" % score

# Called when the node enters the scene tree for the first time.
func _ready():
	updateScore()
	
func connectSignal(brick):
	#print(brick)
	brick.connect("brickDestroyed", self, "countScore")
	
	
func countScore(brickScore):
	print(brickScore)
	score = score + brickScore
	updateScore()

func updateScore():
	print(score)
	scoreDisplay = "%08d" % score
	text = "SCORE: " + str(scoreDisplay)
	