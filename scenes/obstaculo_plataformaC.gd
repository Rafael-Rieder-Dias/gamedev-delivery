extends StaticBody2D

@onready var phy = $PlatC_PHY
@onready var spr = $PlatC_IMG
@onready var player = get_tree().current_scene.get_node("Personagem")

const FallingPlatform = preload("res://scenes/obstaculo_plataformaC.tscn")
const FallingPlatformScript = preload("res://scenes/obstaculo_plataformaC.gd")

var init_global_position = null
var fal := 0
var delay_flash := 0

func _ready():
	init_global_position = global_position

func _process(delta):
	delay_flash -= delta
	if fal > 0 && delay_flash <= 0:
		sprite_flash()
	if fal > 1:
		fall(delta)
	if position.y <= -2000:
		respawn()

func fall(delta):
	position.y += 20 * delta

func respawn():
	var dup = FallingPlatform.instantiate()
	dup.set_script(FallingPlatformScript)
	dup.global_position = init_global_position
	get_tree().current_scene.add_child(dup)
	queue_free()
	
func sprite_flash():
	var tween: Tween = create_tween()
	tween.tween_property(spr, "modulate:v", 1, 0.25).from(15)
	if fal == 1: delay_flash = 40
	elif fal == 2: delay_flash = 20

func _on_plat_c_area_body_entered(body: Node2D) -> void:
	print(body)
	if body == player:
		fal = 1
		await get_tree().create_timer(3).timeout
		fal = 2
