extends Node2D

onready var transition = $UI/Transition
onready var tilemap = $WorldMap
var win_text = ""

func _ready():
	Global.text_box = ""
	win_text = Global.get_win_text()
	calculate_switch_blocks()
	var _error = Global.connect("blocks_switched",self,"calculate_switch_blocks")
	transition.open()
	win_text = Global.get_win_text()

func _unhandled_input(_event):
	if Input.is_action_just_pressed("pause"):
		var _error = get_tree().change_scene("res://UI/Menu.tscn")

func _process(_delta):
	if Global.collected_food == Global.max_dish and Global.text_box == "":
		Global.text_box = win_text

func calculate_switch_blocks():
	if Global.block_switch:
		#4 to 2
		for b in tilemap.get_used_cells_by_id(4):
			tilemap.set_cellv(b,2)
		#3 to 5
		for b in tilemap.get_used_cells_by_id(3):
			tilemap.set_cellv(b,5)
	else:
		#2 to 4
		for b in tilemap.get_used_cells_by_id(2):
			tilemap.set_cellv(b,4)
		#5 to 3
		for b in tilemap.get_used_cells_by_id(5):
			tilemap.set_cellv(b,3)

