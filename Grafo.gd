extends Control

var n = 0
var adjs = []
var a = 0
var nos = []
var state = true

# Called when the node enters the scene tree for the first time.
func _ready():
	if (Global.type_of_play == Global.BUTTON):
		get_node("ModeButton").visible = true
	

func ready(number):
	n = number
	var angulo = 2*PI
	for i in range(n):
		nos.append(0)
		adjs.append([])
		for j in range(n):
			adjs[i].append(false)
		var botao = preload("res://ButtonNode.tscn").instance()
		botao.name = "ButtonNode" + str(i)
		add_child(botao)
		botao.n = i
		var x = sin(angulo)*200 + 512
		var y = cos(angulo)*200 + 300
		botao.set_position(Vector2(x, y))
		angulo -= 2*PI/n
			
func add_edge(x, y):
	if(not adjs[x][y]):
		adjs[x][y] = true
		adjs[y][x] = true
		a += 1
		
func add_val(i, x):
	nos[i] = x
	get_node("ButtonNode" + str(i)).update_label(x)
	
func pull(i):
	for j in range(n):
		if (adjs[i][j]):
			nos[i] += 1
			nos[j] -= 1
			get_node("ButtonNode" + str(j)).update_label(nos[j])
	get_node("ButtonNode" + str(i)).update_label(nos[i])

func push(i):
	for j in range(n):
		if (adjs[i][j] and i != j):
			nos[i] -= 1
			nos[j] += 1
			get_node("ButtonNode" + str(j)).update_label(nos[j])
	get_node("ButtonNode" + str(i)).update_label(nos[i])

	
func draw_edges():
	for i in range(n):
		for j in range(i +1, n):
			if (adjs[i][j]):
				var line = Line2D.new()
				add_child(line)
				line.name = str(i)+ "Aresta" + str(j)
				line.width = 1
				line.add_point(get_node("ButtonNode" + str(i)).get_position())
				line.add_point(get_node("ButtonNode" + str(j)).get_position())

func _on_ButtonNode_pressed(i):
	if (Global.type_of_play == Global.SLIDE):
		pass
	else:
		if(state):
			push(i)
		else:
			pull(i)	


func _on_ModeButton_pressed():
	state = not state
