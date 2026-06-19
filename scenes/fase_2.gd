extends Node2D

@onready var player: Personagem = $Personagem
@onready var player_camera: Camera2D = $Personagem/mc_Camera
@onready var death_camera: Camera2D = $CameraGenerica
@onready var world_boundary: Area2D = $Mundo
@onready var musica = $MusicaDeFundo
@onready var death_sfx = preload("res://SoundsAssets/player_miss(castlevania).mp3")
@onready var vitoria_area = $Vitoria/Vitoria_Area
@onready var label_vitoria = $Controle/Control/LabelVitoria
@onready var fade = $Controle/Control/Fade

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#world_boundary.body_entered.connect(_on_world_boundary_body_entered)
	#player.PlayerDeath.connect(_on_player_death)
	vitoria_area.body_entered.connect(_on_vitoria_area_body_entered)
	label_vitoria.visible = false
	fade.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_vitoria_area_body_entered(body: Node) -> void:
	if body != player:
		return
	fade.visible = true
	var tween = create_tween()
	tween.tween_property(fade, "modulate:a", 0.7, 1.0)
	await get_tree().create_timer(0.8).timeout
	label_vitoria.visible = true
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://scenes/fase_2.tscn")
