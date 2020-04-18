extends KinematicBody2D


var SPEED = 150

func _physics_process(delta):
	
	var movement = Vector2(0,0)
	if Input.is_action_pressed("ui_right"):
		movement.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		movement.x = -SPEED 
	
	var motion = move_and_slide(movement)
	pass
