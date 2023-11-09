extends Control

@onready var active_menu_tab = $Main

func _ready():
	# Reset global vars
	Global.key_collected = false
	Global.total_coins = 0
	Global.coins_collected = 0
	Global.colleted_bubble_x = null
	Global.colleted_bubble_y = null
	Global.colleted_bubble_z = null

func change_menu_tab(tab_to_show):
	active_menu_tab.visible = false
	tab_to_show.visible = true
	active_menu_tab = tab_to_show

func _on_play_pressed():
	change_menu_tab($LevelSelector)

func _on_back_btn_pressed():
	change_menu_tab($Main)
