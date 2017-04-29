extends Node

var particle = load("res://Particle.tscn")
var positions = [Vector2(-40, -160), Vector2(50, 170)]

func _ready():
	for i in range(2):
		var q = particle.instance()
		q.set_name("Particle %d" % [i])
		q.init(i+2)
		q.set_pos(positions[i])
		add_child(q)
	pass

func _process():
	