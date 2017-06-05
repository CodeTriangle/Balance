extends Node

var identity = 0
var quantity = 1
var weight = 2
var colors = [Color(0.9, 0.6, 0.0), Color(0.35, 0.7, 0.9), Color(0.0, 0.6, 0.5), Color(0.95, 0.9, 0.25), Color(0.0, 0.45, 0.7), Color(0.8, 0.4, 0.0), Color(0.8, 0.6, 0.7), Color(0.8, 0.8, 0.8)]

func _ready():
	get_node("GUI/Bar/Decrement").connect("pressed", self, "_press_dec")
	get_node("GUI/Bar/Increment").connect("pressed", self, "_press_inc")
	get_node("GUI/Weight").set_text(String(weight))
	set_process(true)
	set_color(colors[identity])

func _process(delta): get_node("GUI/Bar/Quantity").set_text(String(quantity))

func _press_dec():
	if quantity > 1:
		get_node("/root/Game/Equation").amounts[identity] -= weight
		quantity -= 1

func _press_inc():
	get_node("/root/Game/Equation").amounts[identity] += weight
	quantity += 1