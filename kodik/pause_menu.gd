extends Control

@onready var hud = $"../"
@onready var container = $MarginContainer/VBoxContainer
@onready var button = $MarginContainer/VBoxContainer/Resume
@onready var pauseMenuChildren = findAllChildren()
@onready var settingsChildren = []

func findAllChildren():
	return container.get_children()

func _on_resume_pressed() -> void:
	hud.pauseMenu()

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_back_to_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://sceny/menu.tscn") # Replace with function body.

func createSettingsButtons():
	var settings_volume = HSlider.new()
	var backButton = Button.new()
	settings_volume.value = Global.volume
	backButton.text = "<"
	settingsChildren.append(settings_volume)
	settingsChildren.append(backButton)
	for item in settingsChildren:
		container.add_child(item)
	settings_volume.value_changed.connect(_on_volume_value_changed)
	backButton.pressed.connect(_on_back_pressed)
	
func _on_settings_pressed() -> void:
	for item in pauseMenuChildren:
		container.remove_child(item)
	createSettingsButtons()
	
func changeBackToMenu():
	for item in settingsChildren:
		container.remove_child(item)
	for item in pauseMenuChildren:
		container.add_child(item)
	settingsChildren = []

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause_menu"):
		if !settingsChildren.is_empty():
			changeBackToMenu()
				
func _on_back_pressed():
	changeBackToMenu()

func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, value)
	Global.volume = value
