extends Node2D

@export var Menu : PackedScene

@export var lifes = 3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.add_child(Menu.instantiate())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
