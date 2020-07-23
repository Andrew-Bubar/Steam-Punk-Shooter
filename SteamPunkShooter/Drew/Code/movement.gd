extends KinematicBody2D

#what this will be showing?
export (int) var speed = 200

var velocity = Vector2()

var isShooting = false

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
		
	if Input.is_action_pressed("shoot"):
		isShooting = true
	else:
		isShooting = false
		
	velocity = velocity.normalized() * speed
	
func _physics_process(delta):
	getInput()
	velocity = move_and_slide(velocity)
