extends Node

var classifier = null

func _ready():
	classifier = NumberClassification.new()

func _on_Button_pressed():
	var img = get_viewport().get_texture().get_data()
	var surface_rect = $draw_surface.get_rect()
	var cl = classifier.Classify(img, surface_rect)
	print(cl)
#	$draw_surface.clear()

func _on_classify_timer_timeout():
#	var img = get_viewport().get_texture().get_data()
#	var surface_rect = $draw_surface.get_rect()
#	var cl = classifier.Classify(img, surface_rect)
#	print(cl)
	pass


func _on_draw_surface_started_drawing():
	print("started drawing")
