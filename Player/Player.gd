extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 20
const SPEED = 250
const JUMP_HEIGHT = -560

var andando = 0
var vida = 10
var motion = Vector2()

func _physics_process(delta):
	match andando:
		0:
			$AnimatedSprite.play("idle")
		1:
			$AnimatedSprite.play("walk_right")
		2:
			$AnimatedSprite.play("jump")
		3:
			$AnimatedSprite.play("walk_left")

	
	
	motion.y += GRAVITY #ativa a gravidade
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED #movimento para direita
		andando = 1
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED #movimento para esquerda
		andando = 3
	else:
		if is_on_floor():
			motion.x = 0 #impede que ande infinitamente
			andando = 0
	if is_on_floor():
		#checa se o player está no chão
		if Input.is_action_pressed("ui_up"):
			$AnimatedSprite.play("jump")
			andando = 2
			motion.y = JUMP_HEIGHT #pulo
	motion = move_and_slide(motion, UP)
	
func receberdano(ataque):
	vida -= ataque
	if vida <= 0:
		print(vida)
		queue_free()
