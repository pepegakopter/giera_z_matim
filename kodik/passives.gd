extends Control


@onready var window = $"."
@onready var hud = $".."

@onready var option1 = $MarginContainer/VBoxContainer/o1
@onready var option2 = $MarginContainer/VBoxContainer/o2
@onready var option3 = $MarginContainer/VBoxContainer/o3

var passivesList = ["Movement Speed", "Attack Speed","Projectile Speed","Chance to block an attack","XP Multiplier","Chance for double projectile"]
var windowHidden = true

func _ready() -> void:
	window.hide()

func rollPassives():
	var optionsList = [option1, option2, option3]
	var passivesListCopy = passivesList.duplicate()
	passivesListCopy.shuffle()
	
	for i in range(optionsList.size()):
		optionsList[i].remove_theme_color_override("font_color")
		var percent = randi_range(3,20)
		var passiveName = passivesListCopy[i]
		optionsList[i].text = "%s - +%d%%" % [passiveName, percent]
		if percent == 20:
			optionsList[i].add_theme_color_override("font_color", Color.DARK_GOLDENROD)
		elif percent >= 15:
			optionsList[i].add_theme_color_override("font_color", Color.PURPLE)
		elif percent >= 10:
			optionsList[i].add_theme_color_override("font_color", Color.DODGER_BLUE)
			

func toggleWindow():
	if windowHidden:
		window.show()
		Engine.time_scale = 0
		rollPassives()
	else:	
		window.hide()
		Engine.time_scale = 1
	windowHidden = !windowHidden

func extractData(option: String):
	var optionArray = option.split("-")
	var buffToGive = float(optionArray[-1]) / 100 # np. 0.12
	var buffName = str(optionArray[0]) # np. "Attack Speed"
	print(buffToGive)
	print(buffName)

func _on_o_1_pressed() -> void:
	toggleWindow()
	extractData(option1.text)
	print("%s" % option1.text)

func _on_o_2_pressed() -> void:
	toggleWindow()
	extractData(option2.text)
	print("%s" % option2.text)
	
func _on_o_3_pressed() -> void:
	toggleWindow()
	extractData(option3.text)
	print("%s" % option3.text)
