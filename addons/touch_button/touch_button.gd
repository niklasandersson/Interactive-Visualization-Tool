tool
extends Button

signal touched

func _enter_tree():
	connect("pressed", self, "clicked")

#func _input(event):
#	if event is InputEventScreenTouch:
#		emit_signal("touched")

