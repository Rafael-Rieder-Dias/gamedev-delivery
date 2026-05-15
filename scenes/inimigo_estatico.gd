extends CharacterBody2D

enum State {
	IDLE,
	ATTACK,
	#HURT,
	#DEATH
}

@onready var sprite = $iE_Sprites
@onready var sfx = $iE_SFX
@onready var visao = $iE_Visao

@onready var player = get_tree().current_scene.get_node("Personagem")

@export var tiro : PackedScene
@export var face = -1

var state := State.IDLE
var state_frames := 0
var state_changed := false

var idle_loop := 0
var attack_loop := 0

func _ready():
	if face:
		#código para flippar o behavior caso esteja virado pro outro lado
		pass
	pass

func _physics_process(delta):
	behaviorize(delta)
	animate(delta)
	soundize()
	if state_changed:
		state_changed = false
		state_frames = 0
	state_frames += 1
	pass
	
func behaviorize(delta):
	match state:
		State.IDLE:
			attack_loop -= delta
			if visao.get_collider() == player and attack_loop <= 0:
				state = State.ATTACK
				state_changed = true
				pass
		State.ATTACK:
			if state_frames == 5:
				shoot()
			if state_frames >= 20:
				state = State.IDLE
				attack_loop = 40
				state_changed = true
			#bullet behavior

func animate(delta):
	match state:
		State.IDLE:
			idle_loop-= delta
			if idle_loop <= 0:
				sprite.play("idle")
				idle_loop = 20
		State.ATTACK:
			sprite.play("attack")
	pass
	
func soundize():
	match state:
		State.ATTACK:
			#add sfx for attack
			pass
		_:
			pass
	pass

func shoot():
	var t = tiro.instantiate()
	t.x = face
	add_child(t)
	#t.transform = $Muzzle.transform
