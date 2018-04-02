extends Control

var lines = []
var current_line = -1
var pressed = false
var viewport

func _ready():
	viewport = get_viewport()

func _draw():
	for i in range(current_line + 1):
		if lines[i].size() > 2:
			draw_polyline(lines[i], Color(0, 0, 0, 1), 10, true)

func _process(delta):
	update()

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			current_line += 1
			lines.append([])
			pressed = true
		else:
			pressed = false
	elif event is InputEventMouseMotion:
		if pressed:
			if event.position.x < get_size().x && event.position.y < get_size().y:
				lines[current_line].push_back(event.position)


func _on_ClearButton_pressed():
	lines.clear()
	current_line = -1


func _on_IdentifyButton_pressed():
	pass
