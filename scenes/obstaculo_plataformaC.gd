extends StaticBody2D

@onready var phy = $PlatC_PHY
@onready var spr = $PlatC_IMG
@onready var player = get_tree().current_scene.get_node("Personagem")

const FallingPlatform = preload("res://scenes/obstaculo_plataformaC.tscn")
const FallingPlatformScript = preload("res://scenes/obstaculo_plataformaC.gd")

var init_global_position = null
var fal := 0
var delay_flash := 0
var is_respawning := false
var respawn_pending := false
var world_boundary: Area2D = null
var world_boundary_limit: CollisionShape2D = null

func _ready():
	init_global_position = global_position
	world_boundary = get_tree().current_scene.get_node_or_null("Mundo")
	if world_boundary != null:
		world_boundary_limit = world_boundary.get_node_or_null("Mundo_Limite")

func _process(delta):
	if is_respawning or respawn_pending:
		return
	delay_flash -= delta
	if fal > 0 && delay_flash <= 0:
		sprite_flash()
	if fal > 1:
		fall(delta)
	if is_under_world_boundary():
		respawn_pending = true
		wait_and_respawn()

func fall(delta):
	position.y += 20 * delta

func is_under_world_boundary() -> bool:
	if world_boundary_limit == null or not (world_boundary_limit.shape is WorldBoundaryShape2D):
		return false
	var boundary_shape: WorldBoundaryShape2D = world_boundary_limit.shape
	var boundary_y = world_boundary_limit.global_position.y - boundary_shape.distance
	return global_position.y >= boundary_y

func wait_and_respawn() -> void:
	await get_tree().create_timer(3).timeout
	respawn()

func respawn():
	if is_respawning:
		return
	is_respawning = true
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
	if body == player and fal < 1:
		fal = 1
		await get_tree().create_timer(3).timeout
		fal = 2
