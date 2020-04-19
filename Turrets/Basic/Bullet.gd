extends Area2D


var speed = 250 #velocidade do projétil
var velocity = Vector2() 
var ataque = 20 #dano que causará ao acertar

func start(pos, dir):
	position = pos 
	rotation_degrees = rad2deg(dir)+90 
	velocity = Vector2(speed, 0).rotated(dir) 

func _physics_process(delta):
	position += velocity * delta #delimita a velocidade em quadros por segundo

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Bullet_body_entered(body):
	if body.is_in_group("players"):
		queue_free()
