extends Area2D

@onready var gfx = $p_GFX
@onready var phy = $p_PHY

var delay := 0;

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	delay -= delta
	if !delay:
		gfx.play("default")
		delay = 600
		pass
	pass
