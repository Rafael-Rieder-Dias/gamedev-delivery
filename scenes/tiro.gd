extends Area2D

@onready var sprites = $t_GFX
@onready var physics = $t_PHY

var speed = 150
@export var x = 1
@export var y = null

signal hitplayer
signal hitparry

var has_collided := false

func _ready():
	sprites.play("BULLET")
	connect("body_entered", Callable(self, "on_tiro_collided_with"))
	connect("area_entered", Callable(self, "on_tiro_collided_with"))

func _physics_process(delta):
	if has_collided:
		return
	if y != null:
		# Keep diagonal speed constant regardless of x/y values.
		var direction := Vector2(x, float(y)).normalized()
		position += direction * speed * delta
	else:
		position += Vector2(x, 0) * speed * delta

func on_tiro_collided_with(collision):
	if has_collided:
		return
	has_collided = true
	set_deferred("monitoring", false)
	set_deferred("monitorable", false)
	if collision.name == "Personagem":
		if collision.state == collision.State.PARRY and not collision.caixaprry.disabled:
			emit_signal("hitparry")
		else:
			emit_signal("hitplayer")
	physics.set_deferred("disabled", true)
	sprites.play("DISPERSE")
	await sprites.animation_finished
	queue_free()
