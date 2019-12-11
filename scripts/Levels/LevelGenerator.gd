extends Node2D

onready var brick = preload("res://scenes/Instanced Objects/Brick.tscn")
onready var window = get_viewport_rect().size

export(int,1,8) var brickColumns = 1 #get the user to set the number of columns
export(int,20,50) var brickDistanceFromTop = 20 #get the user to set the distance from top that the bricks spawn
export(int,1,8) var brickHealth = 1 #the user is able to set the health of the bricks
export(Array, StreamTexture) var brickColors = [preload("res://assets/Images/Bricks/Brick Health Colors/Brick1.png")]



# Called when the node enters the scene tree for the first time.
func _ready():
	var brickInstance = brick.instance() #create an instance of the brick initially
	var brickSprite = brickInstance.get_node("Sprite") #get the sprite of the brick and work out the size (x-value)
	var brickSize = brickSprite.texture.get_size()
	var maxPossibleBricks = (window.x/brickSize.x) - 2 #divide the window size by the amount of bricks - 2 to leave space
	spawnBricks(floor(maxPossibleBricks),brickSize)

func spawnBricks(maxPossibleBricks,brickSize):#spawn bricks function
	var freeSpace = window.x-(brickSize.x*maxPossibleBricks) #work out the freespace avalaiabe when bricks are spawned
	for c in range(brickColumns): #loop for as many columns are set by the dev
		for i in range(maxPossibleBricks): #loop for as many bricks are able to fit
			var brickInstance = brick.instance() #create a new brick by instancing it
			brickInstance.position.x = (brickSize.x*i)+freeSpace/2 #for every brick spawned place it the length of the brick away from the previous brick + half the free space
			brickInstance.position.y = brickDistanceFromTop + brickSize.y*c #for every brick spawned place it the height of the brick away from the previous brick + the distanceFromTop which is set by the user
			setBrickProperties(brickInstance)
			add_child(brickInstance) #add the brick to the scene making it visible
		if c % 2 == 1: #add the wall effect to the spawining by adding/removing 1 from the max bricks
			maxPossibleBricks = maxPossibleBricks - 1
			freeSpace = window.x-(brickSize.x*maxPossibleBricks) #work out the new free space after changing the max bricks
		else:
			maxPossibleBricks = maxPossibleBricks + 1
			freeSpace = window.x-(brickSize.x*maxPossibleBricks)#work out the new free space after changing the max bricks
		#Continue the loop

func setBrickProperties(brickInstance):
	brickInstance.brickColors = brickColors
	var brickSprite = brickInstance.get_node("Sprite")
	brickSprite.texture = brickColors[0]
	brickInstance.maxBrickHealth = brickHealth
