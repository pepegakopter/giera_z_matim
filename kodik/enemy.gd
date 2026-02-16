extends CharacterBody2D
class_name Enemy

@export var hp: float = 50
@export var move_speed: float = 50.67

@onready var postka: Postka = $"../postka"

func _physics_process(delta: float) -> void:
	var kierunek = position.direction_to(postka.global_position).normalized()
	velocity = kierunek * move_speed
	move_and_slide()
