extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	update_motion()

func _input(event):
    if event is InputEventScreenDrag:
        print("mouse button event at ", event.position)

func update_motion():
	self.position.x = get_global_mouse_position().x

func changeBallDirection(ballObject):
	var anchor = get_node("Anchor")
	var speed = ballObject.get_linear_velocity().length()
	var paddleSpeed = self.get_linear_velocity().length()
	var direction = ballObject.position - anchor.global_position
	var velocity = direction.normalized()*(ballObject.get_linear_velocity().x+(paddleSpeed/5))
	ballObject.set_linear_velocity(velocity)