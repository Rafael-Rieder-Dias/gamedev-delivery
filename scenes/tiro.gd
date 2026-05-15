extends Area2D

var speed = 150
@export var x = 1
@export var y = null

signal hitplayer
signal hitparry

func _physics_process(delta):
	if (y != null):
		position += transform.x * speed * delta
		pass
	else: position += x * transform.x * speed * delta

func _on_tiro_body_entered(body):
	if body.is_in_group("Personagem Corpo"):
		emit_signal("hitplayer")
		print("hpl")	
	if body.is_in_group("Personagem Parry"):
		emit_signal("hitparry")
		print("hpr")
	queue_free()
