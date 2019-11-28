extends KinematicBody2D

var motion = Vector2()
const PLAYERSPEED = 500
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	update_motion()
	


func update_motion():
	if Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		motion.x = -PLAYERSPEED
	elif Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = PLAYERSPEED
	else:
		motion.x = 0
	move_and_slide(motion)
	
func changeBallDirection(ballObject):
	var anchor = get_node("Anchor")
	var speed = ballObject.get_linear_velocity().length()
	var direction = ballObject.position - anchor.global_position
	var velocity = direction.normalized()*500
	ballObject.set_linear_velocity(velocity)