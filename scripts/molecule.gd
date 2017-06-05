extends Node

var particle = load("res://scenes/particle.tscn")
var molecule = load("res://scenes/molecule.tscn")
var width = 70
var height = 40
var quantity = 1
var particles = 0
var levels = 0
var polygon = Vector2Array([Vector2(-70, -40), Vector2(70, -40), Vector2(70, 40), Vector2(-70, 40), Vector2(-67, 37), Vector2(67, 37), Vector2(67, -37), Vector2(-67, -37), Vector2(-67.01, 37), Vector2(-70.01, 40)])

func _ready():
	get_node("GUI/Buttons/Decrement").connect("pressed", self, "_press_dec")
	get_node("GUI/Buttons/Increment").connect("pressed", self, "_press_inc")
	set_process(true)

func _process(delta): get_node("GUI/Quantity").set_text(String(quantity))

func _press_dec():
	if quantity > 1:
		quantity -= 1
		for i in range(1, get_children().size()):
			get_node("/root/Game/Equation").amounts[get_children()[i].identity] -= get_children()[i].weight

func _press_inc():
	quantity += 1
	for i in range(1, get_children().size()):
		get_node("/root/Game/Equation").amounts[get_children()[i].identity] += get_children()[i].weight

func add_particle(identity, weight):
	var q = particle.instance()
	q.weight = weight
	q.identity = identity
	q.set_name("Particle %d" % [particles])
	q.get_node("GUI/Bar").set_hidden(true)
	add_child(q)
	particles += 1
	resize()

func resize():
	var w = (20*particles) + (10*(particles+1)) 
	var h = 40
	var wi = w-3
	var hi = h-3
	
	set_polygon([ Vector2(-w, -h), Vector2(w, -h), Vector2(w, h), Vector2(-w, h), Vector2(-wi, hi), Vector2(wi, hi), Vector2(wi, -hi), Vector2(-wi, -hi), Vector2(-wi-0.01, hi), Vector2(-w-0.01, h)])
	get_node("GUI").set_pos(Vector2(-40, -h-30))
	
	width = w
	height = h
	center()

func center():
	for i in range(1, get_child_count()):
		get_child(i).set_pos(Vector2(-width+40+(60*(i-1)), 0))
