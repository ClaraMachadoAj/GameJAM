extends Node2D


func _input(event):
	if event is InputEventKey:
		# Verifica se qualquer tecla do teclado foi pressionada
		if event.pressed:
			# 
			get_tree().change_scene_to_file("res://Cenas/cena.tscn")
