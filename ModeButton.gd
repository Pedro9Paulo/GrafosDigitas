extends Button


var label = ["Mode: Push", "Mode: Pull"]
var state = 0

func _on_ModeButton_pressed():
	state = (state+1)%2
	text = label[state]
