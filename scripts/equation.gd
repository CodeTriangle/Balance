extends Node

var side = load("res://scenes/eqside.tscn")
var positions = [Vector2(-240, 0), Vector2(240, 0)]
var position = -1
var amounts = []

func _ready():
	restart()

func restart():
	randomize()
	position = -1
	amounts = []
	for i in get_children(): remove_child(i)
	var e = generate_equation()
	for i in e:
		var q = side.instance()
		q.set_pos(next_pos())
		for j in i: q.add_particle(j[0][0], j[0][1]) if j.size() == 1 else q.add_molecule(j)
		add_child(q)
		
func check():
	for i in amounts:
		if i != 0:
			return false
	return true

func next_pos():
	position += 1
	return positions[position]

func generate_equation(type=0):
	if type == 0: type = randi() % 4 + 1
	if type == 1:
		amounts = [-4, -3]
		return([ 
			[ [[0, 2], [1, 2]] ],
			[ [[0, 2], [1, 1]], [[1, 2]] ]
		])
	elif type == 2:
		amounts = [-4, -1]
		return([
			[ [[0, 2]], [[1, 2]] ],
			[ [[0, 2], [1, 1]] ]
		])
	elif type == 3:
		amounts = [-4, -1, -2]
		return([
			[ [[0, 2]], [[1, 2], [2, 3]] ],
			[ [[0, 2], [2, 1]], [[1, 1]] ]
		])
	elif type == 4:
		amounts = [-9, -2, -1, -8]
		return([
			[ [[0, 2], [1, 1]], [[2, 1], [3, 3]] ],
			[ [[0, 1], [3, 1]], [[2, 2], [1, 3]] ]
		])