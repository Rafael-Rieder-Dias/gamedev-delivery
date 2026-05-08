extends CharacterBody2D

enum State {
	IDLE,
	ATTACK,
	#HURT,
	#DEATH
}

@onready var sprite = $iE_Sprites

var state := State.IDLE
var loop_timer := 0

func _ready(): 
	pass

func _physics_process(delta: float) -> void:
	animate(delta)
	soundize()
	pass
	
func animate(delta):
	match state:
		State.IDLE:
			loop_timer -= delta
			if loop_timer <= 0:
				sprite.play("idle")
				loop_timer = 20
			pass
		State.ATTACK:
			sprite.play("idle")
			pass
	pass
	
func soundize():
	match state:
		State.ATTACK:
			#add sfx for attack
			pass
		_:
			pass
	pass
