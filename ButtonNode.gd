extends Button

var n = -1

func _ready():
	pass


func _on_ButtonNode_pressed():
	get_parent()._on_ButtonNode_pressed(n)
	
func update_label(x):
	text = str(x)
	
