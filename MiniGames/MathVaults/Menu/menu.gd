extends Control

@onready var active_menu_tab = $Main

func change_menu_tab(tab_to_show):
	active_menu_tab.visible = false
	tab_to_show.visible = true
	active_menu_tab = tab_to_show

func _on_play_pressed():
	change_menu_tab($LevelSelector)

func _on_back_btn_pressed():
	change_menu_tab($Main)
