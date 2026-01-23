extends Control

@onready var container = $VBoxContainer
@onready var button = $VBoxContainer/Resume
@onready var pauseMenuChildren = findAllChildren()
@onready var settingsChildren = []

func findAllChildren():
	return container.get_children()
	
