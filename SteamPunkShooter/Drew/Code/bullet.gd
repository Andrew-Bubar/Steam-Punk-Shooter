extends Area2D

export (int) var speed

#setting direction
var dir := Vector2.ZERO

func set_dir(dir: Vector2):
	self.dir = dir

func _process(delta: float) -> void:
	if dir != Vector2.ZERO:
		var velocity = dir * speed
		
		global_position += velocity
