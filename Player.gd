extends Area2D
class_name Player

export (int) var Velocidad
var Movimiento = Vector2()
var screen_size 
var bullet = load("res://Bullet/Bullet.tscn")
var vidas = 13

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	#pass Replace with function body.

func _process(delta):
	Movimiento = Vector2() #setteo en 0 la posicion
	if Input.is_action_just_pressed("shoot"):
		_shoot()
	if Input.is_action_pressed("ui_right"):
		Movimiento.x += 1
	if Input.is_action_pressed("ui_left"):
		Movimiento.x -= 1
	if Input.is_action_pressed("ui_up"):
		Movimiento.y -= 1
	if Input.is_action_pressed("ui_down"):
		Movimiento.y += 1
		
	if Movimiento.length() > 0:
		Movimiento = Movimiento.normalized() * Velocidad
	
	position += Movimiento  * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
func _shoot():
	var newBullet = bullet.instance()
	self.get_parent().add_child(newBullet)
	#newBullet.global_position
	newBullet.global_position = $bPosition.global_position
	newBullet.dir = -1
 
func _on_Player_body_entered(body):
	vidas = vidas -1
	print("Pierde una vida, quedan ", vidas, " vidas")
	#World.emit_signal("change_colour", color_value)
	if (vidas == 0):
		print("GAME OVER")
		self.queue_free()
