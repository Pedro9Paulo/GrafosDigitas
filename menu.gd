extends Control

func _ready():
	pass 

func _on_Play_pressed():
	get_tree().change_scene("res://RandGrafo.tscn")


func _on_Config_pressed():
	get_tree().change_scene("res://Options.tscn")
