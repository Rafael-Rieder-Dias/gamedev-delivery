extends Area2D

var speed = 250
#var playerpe = 
#var playerag = 
#var parry = 

signal hitplayer
signal hitparry

func _physics_process(delta):
	position += -transform.x * speed * delta

func _on_Bullet_body_entered(body):
	#if overlaps_body(playerpe) or overlaps_body(playerag):
		#emit_signal("hitplayer")
	#if overlaps_body(parry):
		#emit_signal("hitparry")
	queue_free()
