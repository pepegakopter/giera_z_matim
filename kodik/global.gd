extends Node

var selected_window_mode = 0
var volume = 100

var baseStats: Dictionary = {
	"movement_speed": 150,
	"attack_speed": 0.2,
	"projectile_speed": 0.2,
	"chance_to_block_an_attack": 0,
	"xp_multiplier": 1,
	"chance_for_double_projectile": 0
}

var bonusStats: Dictionary = {
	"movement_speed": 0,
	"attack_speed": 0,
	"projectile_speed": 0,
	"chance_to_block_an_attack": 0,
	"xp_multiplier": 0,
	"chance_for_double_projectile":0
}


var prevscene = ""
func change_scene(path):
	if get_tree().current_scene:
		prevscene = get_tree().current_scene.scene_file_path
	get_tree().change_scene_to_file(path)

func go_back():
	if prevscene != "":
		change_scene(prevscene)
