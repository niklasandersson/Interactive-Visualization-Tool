extends Control

var lines = []
var current_line = -1
var pressed = false
signal started_drawing

func _ready():
	pass

func _draw():
	for i in range(current_line + 1):
		if lines[i].size() > 2:
			draw_polyline(lines[i], Color(0, 0, 0, 1), 20, true)

func _process(delta):
	update()

func _gui_input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			current_line += 1
			lines.append([])
			pressed = true
			emit_signal("started_drawing")
		else:
			pressed = false
	elif event is InputEventScreenDrag:
		if pressed:
			if event.position.x < get_size().x && event.position.y < get_size().y:
				lines[current_line].push_back(event.position)


func clear():
	lines.clear()
	current_line = -1