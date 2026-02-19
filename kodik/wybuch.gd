extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("shoot"):
		$CPUParticles2D.emitting = true
		$CPUParticles2D.speed_scale = Global.baseStats["attack_speed"]
	if Input.is_action_just_released("shoot"):
		$CPUParticles2D.emitting = false
		
