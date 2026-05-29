extends ParallaxBackground

@onready var p1 = $ParallaxLayer
@onready var p2 = $ParallaxLayer2
@onready var p3 = $ParallaxLayer3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	p1.set_motion_scale(Vector2(0.1, 0))
	p1.set_mirroring(Vector2(1024.0, 0))
	p2.set_motion_scale(Vector2(0.3, 0))
	p2.set_motion_offset(Vector2(0, -90.0))
	p2.set_mirroring(Vector2(1024.0, 0))
	p3.set_motion_scale(Vector2(0.5, 0))
	p3.set_motion_offset(Vector2(0, -90.0))
	p3.set_mirroring(Vector2(1024.0, 0))
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func modifica(bol):
	if bol:
		p1.set_motion_scale(Vector2(0, 0))
		p1.set_mirroring(Vector2(512.0, 0))
		p2.set_motion_scale(Vector2(0, 0))
		p2.set_motion_offset(Vector2(0, -45.0))
		p2.set_mirroring(Vector2(512.0, 0))
		p3.set_motion_scale(Vector2(0, 0))
		p3.set_motion_offset(Vector2(0, -45.0))
		p3.set_mirroring(Vector2(512.0, 0))
	else:
		p1.set_motion_scale(Vector2(0.1, 0))
		p1.set_mirroring(Vector2(1024.0, 0))
		p2.set_motion_scale(Vector2(0.3, 0))
		p2.set_motion_offset(Vector2(0, -90.0))
		p2.set_mirroring(Vector2(1024.0, 0))
		p3.set_motion_scale(Vector2(0.5, 0))
		p3.set_motion_offset(Vector2(0, -90.0))
		p3.set_mirroring(Vector2(1024.0, 0))
