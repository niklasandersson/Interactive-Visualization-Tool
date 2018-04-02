extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	$StartButton.hide()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_StartButton_pressed():
	get_tree().change_scene("res://NumberClassification/number_classification.tscn")


func _on_NumbersButton_pressed():
	$StartButton.show()


func _on_TouchButton_touched():
	get_tree().change_scene("res://NumberClassification/number_classification.tscn")
