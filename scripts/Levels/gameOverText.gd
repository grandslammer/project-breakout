extends Label

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _ready():
	setPivotPoint()
	self.visible = false
	var node = get_tree().get_root().get_node("Level/Ball")
	node.connect("ballNotActive", self, "noMoreBall")
# Called when the node enters the scene tree for the first time.
func noMoreBall():
	self.visible = true
	get_tree().get_root().get_node("Level/AnimationPlayer").play("Game Over Text")
	

func setPivotPoint():
	var textSize = rect_size
	print(textSize.y)
	rect_pivot_offset = Vector2((textSize.x/2),(textSize.y/2))
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
