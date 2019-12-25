extends RigidBody2D

var ballDamage = 1
var ballStartPosition
var reset_state

onready var levelName = get_tree().get_current_scene().get_name()
onready var SpawnBallText = get_tree().get_root().get_node(levelName+"/AnimationPlayer/Spawn Ball Text")
onready var level = get_tree().get_root().get_node(levelName)

var isBallActive = true
var collision
var canSpawnBall = false
# warning-ignore:unused_argument
func _physics_process(delta):
	#print(position.y)
	collision = get_colliding_bodies()
	if isBallActive == true:
		isBelowPaddle()
	#Testing - print(collision.size())
	if collision.size() > 0:
		if collision[0].is_in_group("Bricks"):
			var scoreText = get_tree().get_root().get_node(levelName+"/Score Display")
			var brick = collision[0]
			scoreText.connectSignal(brick)
			collision[0].HitBrick(ballDamage)
		if collision[0].is_in_group("Paddle"):
			collision[0].changeBallDirection(self)
			
func _ready():
	ballStartPosition = position
	
func isBelowPaddle():
	var ballLocation = self.position
	if canSpawnBall != true:
		if ballLocation.y > get_viewport_rect().size.y:
			self.visible = false
			if level.lives <= 0:
				SpawnBallText.visible = false
				level.sendSignal()
				isBallActive = false
			else:
				level.lives = level.lives - 1
				level.livesText.updateLives()
				SpawnBallText.visible = true
				get_tree().get_root().get_node(levelName+"/AnimationPlayer").play("SpawnBall")
				reset_state = true
				canSpawnBall = true
			


func _input(event):
	if canSpawnBall == true:
		if event is InputEventScreenTouch:
			if event.pressed:
				level.spawnBall(self, SpawnBallText)
		if event is InputEventMouseButton:
			if event.pressed:
				level.spawnBall(self, SpawnBallText)

    
func _integrate_forces(state):
	if reset_state:
		state.transform = Transform2D(0.0, Vector2(0, 0))
		linear_velocity = Vector2(0,0)
		gravity_scale = 0
		reset_state = false