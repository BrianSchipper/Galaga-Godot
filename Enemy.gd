extends KinematicBody2D

onready var path_follow = get_parent()

var dir = 0
var speed = 100
var fire = load("res://Enemy_Bullet/Enemy_Bullet.tscn")
var bullet = load("res://Bullet/Bullet.tscn")
var bonus = load("res://Bonus/Bonus.tscn")
#var bullet2 : Bullet

func _ready():
	_shoot()

func _process(delta):
	MovementLoop(delta)
	
func MovementLoop(delta):
	path_follow.set_offset(path_follow.get_offset() + speed * delta)

func _shoot():
	var newFire = fire.instance()
	self.get_parent().add_child(newFire)
	newFire.global_position = $fPosition.global_position
	newFire.dir = 1

func _on_Timer_timeout():
	_shoot()

func _on_ActorDetector_body_entered(body):
	print(body.get_name())
	if ((body.get_name()) == "Bullet"):
		print(body.get_name())
		var newBonus = bonus.instance()
		self.get_parent().add_child(newBonus)
		newBonus.global_position = $fPosition.global_position
		newBonus.dir = 1
		self.queue_free()
