extends KinematicBody2D

#what this will be showing?
export (int) var Speed
export (int) var Ammo
export (PackedScene) var Bullet

onready var endOfGun = $EndOfGun

var velocity = Vector2()

var isShooting = false

func shoot():
	var bullet_init = Bullet.instance()
	add_child(bullet_init)
	bullet_init.global_position = endOfGun.global_position
	
	var target = get_global_mouse_position()
	var dir_to_mouse = bullet_init.global_position.direction_to(target).normalized()
	
	bullet_init.set_dir(dir_to_mouse)
	
	Ammo -= 1

func getInput():
	
	look_at(get_global_mouse_position())
	velocity = Vector2()
	
	#the inputs for movement
	if Input.is_action_pressed("up"):
		velocity.y -= 1
		
	if Input.is_action_pressed("down"):
		velocity.y += 1
		
	if Input.is_action_pressed("left"):
		velocity.x -= 1 
		
	if Input.is_action_pressed("right"):
		velocity.x += 1
		
	velocity = velocity.normalized() * Speed


func _unhandled_input(event):
	if event.is_action_pressed("shoot") and Ammo > 0:
		shoot()
		
func _physics_process(delta):
	getInput()
	velocity = move_and_slide(velocity)
