extends Node2D

@onready var player: Personagem = $Personagem
@onready var player_camera: Camera2D = $Personagem/mc_Camera
@onready var death_camera: Camera2D = $CameraGenerica
@onready var world_boundary: Area2D = $Mundo
@onready var musica = $MusicaDeFundo
@onready var death_sfx = preload("res://SoundsAssets/player_miss(castlevania).mp3")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	world_boundary.body_entered.connect(_on_world_boundary_body_entered)
	player.PlayerDeath.connect(_on_player_death)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_world_boundary_body_entered(body: Node) -> void:
	if body != player:
		return

	player._on_hitkill()


func _on_player_death() -> void:
	if player_camera != null and death_camera != null:
		death_camera.global_position = player_camera.global_position
		death_camera.offset = player_camera.offset
		death_camera.rotation = player_camera.rotation
		death_camera.zoom = player_camera.zoom
		player_camera.enabled = false
		death_camera.enabled = true
	musica.stream = death_sfx
	musica.play()
	await get_tree().create_timer(2).timeout
	get_tree().reload_current_scene()
