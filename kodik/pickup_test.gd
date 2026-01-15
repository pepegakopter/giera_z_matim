extends Node2D

var player_in_area = false
var potka = preload("res://assety/img/potka_hp.png")

@export var item: InvItem

func _process(delta: float) -> void:
	if player_in_area == true:
		if Input.is_action_just_pressed("pickup"):
			print("powinno dropnac")
			drop_potion()

func _on_pickup_area_area_entered(area: Area2D) -> void:
	pass

func drop_potion():
	pass


	
