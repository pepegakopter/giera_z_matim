extends Control

@onready var hud = $"../"
@onready var container = $MarginContainer/VBoxContainer
@onready var button = $MarginContainer/VBoxContainer/Resume

func findAllChildren():
	return container.get_children()

func _on_resume_pressed() -> void:
	hud.pauseMenu()

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_back_to_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://sceny/menu.tscn") # Replace with function body.

func _on_settings_pressed() -> void:
	hud.toggleSettings()
