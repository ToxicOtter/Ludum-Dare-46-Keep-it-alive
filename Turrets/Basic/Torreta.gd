extends KinematicBody2D

var preco = 50
export (PackedScene) var tiro
export (float) var tempo
var can_shoot = false
var alvo
onready var node = get_node("Node2D")

func _ready():
	$Timer.wait_time = tempo

func _physics_process(delta):
	#checa e dispara a função de tiro
	if can_shoot:
		$Sprite2.look_at(alvo.position)
		shoot(alvo.position)

func shoot(pos):
	var b = tiro.instance()
	var a = (pos - global_position).angle()
	b.start($Sprite2/Area2D.global_position, a + rand_range(-0.05, 0.05))
	get_node("../..").add_child(b)
	can_shoot = false
	$Timer.start()
	pass

func _on_Timer_timeout():
	#Quando a contagem encerra, ele torna verdadeira a condição para tiro
	can_shoot = true

func _on_Area_body_entered(body):
	#Identifica o alvo e torna verdadeira a condição para atirar
	if body.is_in_group("player"):
		can_shoot = true
		alvo = body

func _on_Area_body_exited(body):
	#torna falsa a condição para tiro e para o Timer, impedindo que reative a condição
	can_shoot = false
	$Timer.stop()
