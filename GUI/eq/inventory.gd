extends Control

var items_to_load := [
	"res://GUI/resy/wand_1.tres",
	"res://GUI/resy/offhand_1.tres"

]

func _ready() -> void:
	for i in 24:
		var slot := InventorySlot.new()
	for i in items_to_load.size():
		var item = InventorySlot.new()
