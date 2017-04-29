extends Node

var side = load("res://EqSide.tscn")
var positions = [Vector2(-240, 0), Vector2(240, 0)]

func _ready():
	for i in range(2):
		var q = side.instance()
		q.set_pos(positions[i])
		add_child(q)
	var r = Polygon2D.new()
	r.set_polygon( [Vector2(-2, -250), Vector2(-2, 250), Vector2(2, -250), Vector2(2, 250)] )
	add_child(r)
	pass
