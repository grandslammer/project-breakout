extends Label

onready var levelName = get_tree().get_current_scene().get_name()
onready var RestartText = get_tree().get_root().get_node(levelName+"/AnimationPlayer/Restart Text")
onready var SpawnBallText = get_tree().get_root().get_node(levelName+"/AnimationPlayer/Spawn Ball Text")
onready var node = get_tree().get_root().get_node(levelName)


func _ready():
	node.connect("noMoreLives", self, "startNewGame")
	start()


func start():
	setPivotPoint(self)
	setPivotPoint(SpawnBallText)
	self.visible = false
	RestartText.visible = false
# Called when the node enters the scene tree for the first time.
func startNewGame():
	node.lives = node.lives - 1
	node.livesText.updateLives()
	RestartText.visible = true
	self.visible = true
	get_tree().get_root().get_node(levelName+"/AnimationPlayer").play("Game Over Text")
	

func setPivotPoint(object):
	var textSize = object.rect_size
	print(textSize.y)
	object.rect_pivot_offset = Vector2((textSize.x/2),(textSize.y/2))
	
func _input(event):
	if node.resetGame == true :
		if event is InputEventScreenTouch:	
			if event.pressed:
				node.restartGame()
		if event is InputEventMouseButton:
			if event.pressed:
				node.restartGame()
		else:
			pass