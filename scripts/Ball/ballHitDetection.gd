extends RigidBody2D

var ballDamage = 1


# warning-ignore:unused_argument
func _physics_process(delta):
	var collision = get_colliding_bodies()
	isBelowPaddle()
	#Testing - print(collision.size())
	if collision.size() > 0:
		if collision[0].is_in_group("Bricks"):
			collision[0].HitBrick(ballDamage)
		if collision[0].is_in_group("Paddle"):
			collision[0].changeBallDirection(self)
			
			
func isBelowPaddle():
	var ballLocation = self.position
	#print(ballLocation.y)
	if ballLocation.y > get_viewport_rect().size.y:
		self.queue_free()
		