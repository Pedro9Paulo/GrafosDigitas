extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Tradicional_pressed():
	Global.type_of_play = Global.BUTTON


func _on_Alternativo_pressed():
	if (Global.andoid):
		Global.type_of_play = Global.SLIDE
	else:
		Global.type_of_play = Global.MOUSE


func _on_Voltar_pressed():
	get_tree().change_scene("res://menu.tscn")
