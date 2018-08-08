extends Node2D


func _on_launch_button_pressed():
	$projectile.start()


func _on_reset_button_pressed():
	$projectile.reset()
