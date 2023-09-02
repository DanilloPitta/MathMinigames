extends Control

const equations_list = preload("res://Scripts/equations_list.gd")

var equation_id
var equation
var display

var points_draw = []

@onready var screen_container = $CanvasLayer/CenterContainer/Container/Border2/Container
@onready var screen_helpbox = $CanvasLayer/CenterContainer/Container/Border2/HelpBox
@onready var screen_correct_alert = $CanvasLayer/CenterContainer/Container/Border2/CorrectAlert
@onready var screen_wrong_alert = $CanvasLayer/CenterContainer/Container/Border2/WrongAlert
@onready var screen_tip_unlock_alert = $CanvasLayer/CenterContainer/Container/Border2/TipUnlockAlert

signal form_completed()

func _ready():
	Global.paused = true
	
	equation = get_equation_by_id(equation_id)
	screen_container.get_node("EquationDisplay").text = equation.statement
	
	screen_helpbox.get_node("Content").text = equation.tip
	
	if equation.values_need[0]:
		screen_container.get_node("Bubbles/X").visible = true
	if equation.values_need[1]:
		screen_container.get_node("Bubbles/Y").visible = true
	if equation.values_need[2]:
		screen_container.get_node("Bubbles/Z").visible = true
	
	if Global.colleted_bubble_x and equation.values_need[0]:
		screen_container.get_node("Bubbles/X/XBubbleText").text = Global.colleted_bubble_x
	if Global.colleted_bubble_y and equation.values_need[1]:
		screen_container.get_node("Bubbles/Y/YBubbleText").text = Global.colleted_bubble_y
	if Global.colleted_bubble_z and equation.values_need[2]:
		screen_container.get_node("Bubbles/Z/ZBubbleText").text = Global.colleted_bubble_z
		
	if equation.image:
		screen_container.get_node("Img").texture = load("res://Assets/EquationsImg/" + equation.image)
		
	if equation.type == "normal":
		screen_container.get_node("NormalInput").visible = true
	elif equation.type == "fraction":
		screen_container.get_node("FractionInput").visible = true
		
	$CanvasLayer/AnimationPlayer.play("fade_in")

func _on_submit_pressed():
	if equation.type == "normal":
		var response = screen_container.get_node("NormalInput/Input").text
		if response == equation.response:
			correct_response()
		else:
			wrong_response()
			
	elif equation.type == "fraction":
		var numerator_response = screen_container.get_node("FractionInput/Numerator").text
		var denominator_response = screen_container.get_node("FractionInput/Denominator").text
		if numerator_response == equation.numerator and denominator_response == equation.denominator:
			correct_response()
		else:
			wrong_response()

func correct_response():
		screen_correct_alert.visible = true
		$CanvasLayer/AnimationPlayer.play("correct_alert_open")
		await get_tree().create_timer(1.5).timeout
		
		Global.equation_form_oppened = false
		display.completed = true
		get_parent().get_node("EquationForm").queue_free()
		
		open_door()
		
		Global.paused = false
		
func wrong_response():
	screen_wrong_alert.visible = true
	$CanvasLayer/AnimationPlayer.play("wrong_alert_open")
	await get_tree().create_timer(1.5).timeout
		
	screen_wrong_alert.visible = false
	
func get_equation_by_id(id):
	for equation in equations_list.equations:
		if equation.id == id:
			return equation
			
func open_door():
	var doors = get_parent().get_node("Doors").get_children()
	for door in doors:
		if door.id == display.door_id:
			door.open_door()

func _on_close_button_pressed():
	Global.equation_form_oppened = false
	get_parent().get_node("EquationForm").queue_free()
	Global.paused = false

func _on_help_button_pressed():
	if display.tip_unlocked == false:	
		screen_tip_unlock_alert.visible = true
		$CanvasLayer/AnimationPlayer.play("tip_unlock_alert_open")
	else:
		screen_helpbox.visible = true

func _on_tip_unlock_no_pressed():
	screen_tip_unlock_alert.visible = false
	
func _on_tip_unlock_yes_pressed():
	if Global.coins_collected != 0:
		display.tip_unlocked = true
		screen_tip_unlock_alert.visible = false
		screen_helpbox.visible = true
		
		Global.coins_collected -= 1
		get_tree().get_root().get_child(1).get_node("Hud").update_coin_hud()

func _on_help_back_pressed():
	screen_helpbox.visible = false

func _on_open_draw_pressed():
	$CanvasLayer/DrawScreen.visible = true

func _on_help_draw_pressed():
	$CanvasLayer/DrawScreen.visible = false
