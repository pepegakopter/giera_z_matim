extends Node

var selected_window_mode = 0
var volume = 100


var playerStats = {
	"MovementSpeed": 20,
	"AttackSpeed": 0.25,
	"ProjectileSpeed": 20,
	"Chancetoblockanattack": 0.2,
	"XPMultiplier": 1,
	"Chancefordoubleprojectile":0.3
}


var prevscene = ""
func change_scene(path):
	if get_tree().current_scene:
		prevscene = get_tree().current_scene.scene_file_path
	get_tree().change_scene_to_file(path)

func go_back():
	if prevscene != "":
		change_scene(prevscene)
