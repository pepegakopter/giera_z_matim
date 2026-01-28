extends Control

@onready var hud = $".."
@onready var volumeNumber = $MarginContainer/VBoxContainer/HBoxContainer/VolumeNumber
@onready var volumeRange = $MarginContainer/VBoxContainer/volume
@onready var windowOptions = $MarginContainer/VBoxContainer/window

func _ready() -> void:
	windowOptions.selected = Global.selected_window_mode
	volumeRange.value = Global.volume
	volumeNumber.text = str(int(Global.volume))

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause_menu"):
		hud._on_esc_press()

func _on_back_pressed() -> void:
	hud.toggleSettings() # Replace with function body.

func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, value)
	Global.volume = value
	volumeNumber.text = str(int(Global.volume))

func _on_window_item_selected(index: int) -> void:
	match index:
		0:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			Global.selected_window_mode = 0
		1:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
			Global.selected_window_mode = 1
		2:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			Global.selected_window_mode = 2
