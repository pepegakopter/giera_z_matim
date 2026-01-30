extends Node

var selected_window_mode = 0
var volume = 100

var attackSpeed = 0.25

var prevscene = ""
func change_scene(path):
	if get_tree().current_scene:
		prevscene = get_tree().current_scene.scene_file_path
	get_tree().change_scene_to_file(path)

func go_back():
	if prevscene != "":
		change_scene(prevscene)
