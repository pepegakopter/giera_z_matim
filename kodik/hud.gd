extends Control

@onready var hearts = [$serce1, $serce2, $serce3, $serce4]
@onready var pause_menu = $PauseMenu
var paused = false

var health := 4.0

func _ready():
	pause_menu.hide()
	update_hearts()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("k"):
		health = max(-1, health - 0.5)
		if health >= 0:
			update_hearts()
	if Input.is_action_just_pressed("heal_test"):
		health = 4
		update_hearts()
	if Input.is_action_just_pressed("pause_menu"):
		pauseMenu()
		
func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	paused = !paused

func update_hearts():
	var hp = health
	for heart in hearts:
		if hp >= 1:
			heart.play("full")
		elif hp >= 0.5:
			heart.play("cracked")
		elif hp == 0:
			heart.play("default")
			
		hp -= 1
