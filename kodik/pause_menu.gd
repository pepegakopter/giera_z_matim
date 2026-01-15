extends Control

@onready var hud = $"../"

func _on_resume_pressed() -> void:
	hud.pauseMenu()

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_back_to_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://sceny/menu.tscn") # Replace with function body.
