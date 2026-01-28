extends CharacterBody2D
class_name Postka

@export var speed = 150
@export var HP = 10
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

@export var flash_distance := 100.0
var flash_cooldown := 0.0
var can_flash := true

func _process(delta):
	if Engine.time_scale != 0:
		if Input.is_action_just_pressed("dash") and can_flash:
			perform_flash()


func perform_flash():
	if velocity.length() == 0:
		return 
	can_flash = false

	var direction = velocity.normalized()
	var target_position = global_position + direction * flash_distance
	# fwadwlash (teleport)
	global_position = target_position

	# start cooldown
	start_flash_cooldown()

func start_flash_cooldown():
	await get_tree().create_timer(flash_cooldown).timeout
	can_flash = true
		

func _ready() -> void:
	anim.play("idle")

# japidi co to jest xdd
func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("down"):
		anim.play("walk")
	elif Input.is_action_pressed("up"):
		anim.play("walk")
	elif Input.is_action_pressed("left"):
		anim.play("walk")
	elif Input.is_action_pressed("right"):
		anim.play("walk")
	else:
		anim.play("idle")
		
func player():
	pass

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	

func _physics_process(delta):
	get_input()
	move_and_slide()

	
	
