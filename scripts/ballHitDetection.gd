extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# warning-ignore:unused_argument
func _physics_process(delta):
	var collision = get_colliding_bodies()
	#Testing - print(collision.size())
	if collision.size() > 0:
		if collision[0].is_in_group("Bricks"):
			collision[0].Kill()
		if collision[0].is_in_group("Paddle"):
			collision[0].changeBallDirection(self)