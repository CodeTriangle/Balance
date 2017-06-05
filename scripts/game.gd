extends Node

func _ready():
	get_node("New").connect("pressed", self, "generate_level")
	get_node("Instructions").connect("pressed", self, "show_instructions")
	get_node("Check").connect("pressed", self, "check")

func generate_level():
	get_node("Equation").restart()
	get_node("Win").set_hidden(true)

func show_instructions():
	get_node("Instp").set_hidden(false)
	get_node("Instructions").disconnect("pressed", self, "show_instructions")
	get_node("Instructions").connect("pressed", self, "hide_instructions")

func hide_instructions():
	get_node("Instp").set_hidden(true)
	get_node("Instructions").disconnect("pressed", self, "hide_instructions")
	get_node("Instructions").connect("pressed", self, "show_instructions")
	
func check():
	if get_node("Equation").check() == true:
		get_node("Win").set_hidden(false)