extends Node2D

@onready var musica = $MusicaDeFundo
@onready var comecar = $CanvasLayer/ComecarJogo
@onready var sair = $CanvasLayer/Sair
@onready var ajuda = $CanvasLayer/ComoJogar
@onready var ajudapainel = $CanvasLayer/ComoJogar/Painel
@onready var ajudapainelfec = $CanvasLayer/ComoJogar/Painel/Fechar
@onready var creditos = $CanvasLayer/Creditos
@onready var creditospainel = $CanvasLayer/Creditos/Painel
@onready var creditospainelfec = $CanvasLayer/Creditos/Painel/Fechar

func _ready() -> void:
	ajudapainel.visible = false
	creditospainel.visible = false
	pass


func _process(_delta) -> void:
	if creditospainel.visible and creditospainelfec.button_pressed:
		creditospainel.visible = false
		pass
	if creditos.button_pressed:
		creditospainel.visible = true
		pass
	if ajudapainel.visible and ajudapainelfec.button_pressed:
		ajudapainel.visible = false
		pass
	if ajuda.button_pressed:
		ajudapainel.visible = true
		pass
	if comecar.button_pressed:
		get_tree().change_scene_to_file("res://scenes/teste.tscn")
	if sair.button_pressed:
		get_tree().quit()
	pass