extends KinematicBody2D

func Kill():
	self.queue_free()
