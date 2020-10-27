extends KinematicBody2D

onready var path_follow = get_parent()

var dir = 0
var speed = 300

func _process(delta):
	MovementLoop(delta)
	
func MovementLoop(delta):
	path_follow.set_offset(path_follow.get_offset() + speed * delta)
