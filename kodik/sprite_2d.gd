extends CharacterBody2D

@export var speed = 400
var screen_size
@onready var pause_menu = $PauseMenu
var paused = false

func _ready() -> void:
	print("elo")
	screen_size = get_viewport_rect().size

func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("mv_right"):
		velocity.x +=1
	if Input.is_action_pressed("mv_left"):
		velocity.x -=1
	if Input.is_action_pressed("mv_up"):
		velocity.y -=1
	if Input.is_action_pressed("mv_down"):
		velocity.y +=1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
