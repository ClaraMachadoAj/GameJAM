extends Control

var key_1 = "_"
var key_2 = "_"
var key_3 = "_"
var key_4 = "_"
var key_5 = "_"

var next = 1

func _process(delta):
	
	##Label Key
	$Key_1.text = str(key_1)
	$Key_2.text = str(key_2)
	$Key_3.text = str(key_3)

	
	if next > 3:
		next = 1
func _on_but_0_pressed():
	if next == 1:
		key_1 = 1
	if next == 2:
		key_2 = 1
	if next == 3:
		key_3 = 1

	
	next += 1

func _on_but_2_pressed():
	if next == 1:
		key_1 = 2
	if next == 2:
		key_2 = 2
	if next == 3:
		key_3 = 2
	
	
	next += 1



func _on_but_3_pressed():
	if next == 1:
		key_1 = 3
	if next == 2:
		key_2 = 3
	if next == 3:
		key_3 = 3

	
	next += 1



func _on_but_4_pressed():
	if next == 1:
		key_1 = 4
	if next == 2:
		key_2 = 4
	if next == 3:
		key_3 = 4

	
	next += 1



func _on_but_5_pressed():
	if next == 1:
		key_1 = 5
	if next == 2:
		key_2 = 5
	if next == 3:
		key_3 = 5

	
	next += 1



func _on_but_6_pressed():
	if next == 1:
		key_1 = 6
	if next == 2:
		key_2 = 6
	if next == 3:
		key_3 = 6

	
	next += 1



func _on_but_7_pressed():
	if next == 1:
		key_1 = 7
	if next == 2:
		key_2 = 7
	if next == 3:
		key_3 = 7

	
	next += 1



func _on_but_8_pressed():
	if next == 1:
		key_1 = 8
	if next == 2:
		key_2 = 8
	if next == 3:
		key_3 = 8

	
	next += 1



func _on_but_9_pressed():
	if next == 1:
		key_1 = 9
	if next == 2:
		key_2 = 9
	if next == 3:
		key_3 = 9

	
	next += 1



func _on_but_10_pressed():
	if next == 1:
		key_1 = 0
	if next == 2:
		key_2 = 0
	if next == 3:
		key_3 = 0

	
	next += 1

func _on_but_del_pressed():
	key_1 = 0
	key_2 = 0
	key_3 = 0
	key_4 = 0
	key_5 = 0
	
	next = 1


func _on_but_go_pressed():
	
	$Chave.text = "Error"
	$Chave.modulate = Color(255,0,0)
	
	if key_1 == 2:
		if key_2 == 1:
			if key_3 == 9:

						$Chave.text = "Unlocked"
						$Chave.modulate = Color(0,255,0)
						
						get_tree().change_scene_to_file("res://Cenas/cena.tscn")
					
	
	


func _on_but_sair_pressed():
	get_tree().change_scene_to_file("res://Cenas/cena.tscn")
