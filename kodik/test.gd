extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("ready test")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("k"):
		print("dwafahfafua")
		texture = load("res://serceEmpty_8x8.png")
