extends Control


@onready var window = $"."
@onready var hud = $".."

@onready var option1 = $MarginContainer/VBoxContainer/o1
@onready var option2 = $MarginContainer/VBoxContainer/o2
@onready var option3 = $MarginContainer/VBoxContainer/o3
var optionsList = [option1, option2, option3]

var passivesList = ["Movement Speed", "Attack Speed","Projectile Speed","Chance to block an attack","XP Mult","Chance for double projectile"]
var windowHidden = true

func _ready() -> void:
	window.hide()

func rollPassives():
	var optionsList = [option1, option2, option3]
	var passivesListCopy = passivesList.duplicate()
	passivesListCopy.shuffle()
	
	for i in range(optionsList.size()):
		var percent = randi_range(3,20)
		var passiveName = passivesListCopy[i]
		optionsList[i].text = "%s - +%d%%" % [passiveName, percent]


func toggleWindow():
	if windowHidden:
		window.show()
		Engine.time_scale = 0
		rollPassives()
	else:	
		window.hide()
		Engine.time_scale = 1
	windowHidden = !windowHidden

func _on_o_1_pressed() -> void:
	toggleWindow()
	print("%s" % option1.text)

func _on_o_2_pressed() -> void:
	toggleWindow()
	print("%s" % option2.text)
	
func _on_o_3_pressed() -> void:
	toggleWindow()
	print("%s" % option3.text)
