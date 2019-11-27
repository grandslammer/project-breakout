extends KinematicBody2D

var motion = Vector2()
const PLAYERSPEED = 300
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_motion()


func update_motion():
	if Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		motion.x = -PLAYERSPEED
	elif Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = PLAYERSPEED
	else:
		motion.x = 0
	move_and_slide(motion)