extends Node

var VP = null

var score = 0
var time = 90
var lives = 0

func _ready():
	randomize()
	pause_mode = Node.PAUSE_MODE_PROCESS
	VP = get_viewport().size
	var _signal = get_tree().get_root().connect("size_changed",self,"_resize")
	reset()

func _unhandled_input(event):
	if event.is_action_pressed("menu"):
		var Pause_Menu = get_node_or_null("/root/Game/UI/Pause_Menu")
		if Pause_Menu == null:	
			get_tree().quit()
		else:
			if Pause_Menu.visible:
				Pause_Menu.hide()
				get_tree().paused = false
			else:
					Pause_Menu.show
					get_tree().paused = true

func _resize():
	VP = get_viewport().size
	var HUD = get_node_or_null("/root/Game/UI/HUD")
	if HUD != null:
		HUD.update_lives()

func update_score(s):
	score = score + s
	var HUD = get_node_or_null("/root/Game/UI/HUD")
	if HUD != null:
		HUD.update_score()


func update_lives(l):
	lives += l
	if lives < 0:
		var _scene = get_tree().change_scene("res://UI/End_Game.tscn")
	
	
func reset():
	score = 0
	time = 30
	lives = 5
