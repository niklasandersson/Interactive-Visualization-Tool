extends Control

var lines = []
var current_line = -1
var pressed = false

func _ready():
	pass

func _draw():
	for i in range(current_line + 1):
		if lines[i].size() > 2:
			draw_polyline(lines[i], Color(0.2, 1.0, .7, 1), 10, true)

func _process(delta):
	update()

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			current_line += 1
			lines.append([])
			pressed = true
		else:
			pressed = false
	elif event is InputEventMouseMotion:
		if pressed:
			lines[current_line].push_back(event.position)
