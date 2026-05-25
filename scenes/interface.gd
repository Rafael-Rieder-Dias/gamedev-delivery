extends Control

@onready var player = get_tree().current_scene.get_node("Personagem")
@onready var energy = $Energy
@onready var energylabel = $Energy/EnergyLabel
@onready var overchargelabel = $Energy/OverchargeLabel
@onready var recharge = $Recharge
@onready var rechargelabel = $Recharge/RechargeLabel

@export var parry_energy_ui_delay := 0.2

func _ready() -> void:
	energy.value = player.energy-10
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_energy(delta)
	update_recharge(delta)
	energylabel.text = "%s" % int(energy.value)
	overchargelabel.text = "OVER" if player.energy > 100 else ""
	rechargelabel.text = "%s" % int(player.recharge)

func update_energy(_delta) -> void:
	if player.parry_time_left > 0.125:
		return
	else:
		energy.value = move_toward(energy.value, player.energy, 1.2)

func update_recharge(_delta):
	recharge.value = move_toward(recharge.value, player.recharge, 1.2)
