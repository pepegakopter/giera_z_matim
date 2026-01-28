class_name InventorySlot
extends PanelContainer

@export var type: ItemData.Type
var player

func _ready() -> void:
	player = get_tree().get_nodes_in_group("postac")


func init(t: ItemData.Type, cms: Vector2) -> void:
	type = t
	custom_minimum_size = cms
	
func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	if data in InventoryItem:
		if type == ItemData.Type.MAIN:
			if get_child_count() == 0:
				return true
			else:
				if type == data.get_parent().type:
					return true
				return get_child(0).data.type == data.data.type
		else:
			return data.data.type == type
	return false
	
func _drop_data(_at_position: Vector2, data: Variant) -> void:
	if get_child_count() > 0:
		var item := get_child(0)
		player[0].damage -= item.data.item_damage
		player[0].defence -= item.data.item_defence
		if item == data:
			return
		item.reparent(data.get_parent())
	if type != ItemData.Type.MAIN:
		player[0].damage += data.data.item_damage
		player[0].defence += data.data.item_defence
	else:
		player[0].damage -= data.data.item_damage
		player[0].defence -= data.data.item_defence
	data.reparent(self)
		
