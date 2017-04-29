extends Node

var quantity = 1
var weight = 2

func _ready():
	get_node("GUI/Decrement").connect("pressed", self, "_press_dec")
	get_node("GUI/Increment").connect("pressed", self, "_press_inc")
	get_node("GUI/Weight").set_text(String(weight))
	set_process(true)
	pass
	
func init(w):
	weight = w

func _process(delta):
	get_node("GUI/Quantity").set_text(String(quantity))
	pass

func _press_dec():
	if quantity > 1:
		quantity -= 1
		print("decremented quantity to %d, now have %d" % [quantity, quantity*weight])
	pass
	
func _press_inc():
	quantity += 1
	print("incremented quantity to %d, now have %d" % [quantity, quantity*weight])
	pass