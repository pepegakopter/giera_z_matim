extends Node2D
class_name ExpOrb

@export var postac: Postka
@onready var area = $Area2D


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

# sprawdza czy gracz jest w area do zebrania expai go zbiera
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Postka:
		body.expik += 5
		print(body.expik)
		queue_free() # usuwa orb po zebraniu
