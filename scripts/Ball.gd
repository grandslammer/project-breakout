extends KinematicBody2D

var speed = 1000
var velocity = Vector2(0, speed)



func _ready():
	pass




func start(delta):
    #velocity = Vector2(0, -speed)
	pass




func _physics_process(delta):
    var collision = move_and_collide(velocity * delta)
    if collision:
        velocity = velocity.bounce(collision.normal)
        if collision.collider.has_method("hit"):
            collision.collider.hit()