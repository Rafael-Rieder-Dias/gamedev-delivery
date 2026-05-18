extends Area2D

@onready var physics = $t_PHY
var speed = 150
@export var x = 1
@export var y = null

signal hitplayer
signal hitparry

func _ready():
	connect("body_entered", Callable(self, "on_tiro_collided_with"))
	connect("area_entered", Callable(self, "on_tiro_collided_with"))

func _physics_process(delta):
	if (y != null):
		position += transform.x * speed * delta
		pass
	else: position += x * transform.x * speed * delta

func on_tiro_collided_with(collision):
	if collision.name == "Personagem":
		if collision.state == collision.State.PARRY and not collision.caixaprry.disabled:
			emit_signal("hitparry")
		else:
			emit_signal("hitplayer")
	queue_free()
