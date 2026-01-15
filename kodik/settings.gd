extends Control

@onready var windowOptions = $MarginContainer/VBoxContainer/window
@onready var volumeRange = $MarginContainer/VBoxContainer/volume
@onready var volumeNumber = $MarginContainer/VBoxContainer/HBoxContainer/VolumeNumber



func _ready() -> void:
	windowOptions.selected = Global.selected_window_mode
	volumeRange.value = Global.volume
	volumeNumber.text = str(Global.volume)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, value)
	Global.volume = value
	volumeNumber.text = str(Global.volume)

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

func _on_go_back_pressed() -> void:
	Global.go_back()
