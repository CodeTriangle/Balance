extends Node

var particle = load("res://scenes/particle.tscn")
var molecule = load("res://scenes/molecule.tscn")
var particles = 0
var molecules = 0
var things = 0
var positions = [Vector2(-40, -160), Vector2(50, 170)]

func _ready():
	
	pass

func add_particle(identity, weight):
	var q
	q = particle.instance()
	q.weight = weight
	q.identity = identity
	q.set_name("Particle %d" % [things])
	q.set_pos(positions[things])
	add_child(q)
	things += 1
	particles += 1

func add_molecule(particles):
	var q
	q = molecule.instance()
	q.set_name("Molecule %d" % [things])
	q.set_pos(positions[things])
	for k in particles:
		q.add_particle(k[0], k[1])
	add_child(q)
	things += 1
	molecules += 1