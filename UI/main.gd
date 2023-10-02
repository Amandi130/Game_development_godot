extends MarginContainer

const first_level = preload("res://Maps/Level1.tscn")

var current_selection= 0
onready var selector_1=$CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var selector_2=$CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/Selector
onready var selector_3=$CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer3/HBoxContainer/Selector

func _ready():
	set_current_selection(0)

func _process(delta):
	if Input.is_action_just_pressed("ui_down") and current_selection <2:
		current_selection +=1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_up") and current_selection >0:
		current_selection -=1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_accept"):
		handle_selection(current_selection)
		
func handle_selection(_current_selection):
	if _current_selection == 0:
		get_tree().change_scene("res://Maps/Level1.tscn")
	elif _current_selection ==1:
		get_tree().change_scene("res://UI/how to play.tscn")
	elif _current_selection ==2:
		get_tree().quit()
		
func set_current_selection(_current_selection):
	selector_1.text=""
	selector_2.text=""
	selector_3.text=""
	if _current_selection==0:
		selector_1.text=">"
	elif current_selection == 1:
		selector_2.text =">"
	elif current_selection == 2:
		selector_3.text =">"
