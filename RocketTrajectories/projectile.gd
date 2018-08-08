extends Area2D

var is_running = false
var time = 0.0
var v0 = 0.0
var k = 2.0
var m = 5.0
var alpha = 0
var g = 9.82
var previous_pos = Vector2(0.0, 0.0)
var angle = 0.0

var size_in_meters = 50.0

var target_hit = false

func _ready():

	time = 0.0
	position.x = 0
	position.y = 950

func _process(delta):
	time = time + delta

	if !target_hit && is_running:
		var x = v0 * cos(alpha) * m/k * (1.0 - exp(-k/m*time))
		var y = -m*g*time/k + m/k*(m*g/k + v0*sin(alpha))*(1.0 - exp(-k/m*time))

		previous_pos = position

		position.x = meters_to_pixels(x)
		position.y = 950 - meters_to_pixels(y)

		$Sprite.rotate(angle)
		angle = previous_pos.angle_to(Vector2(1.0, 0.0))
		$Sprite.rotate(-angle)


func _on_projectile_body_entered(body):
	print(body.name)


func _on_projectile_area_entered(area):
	if area.name == "target":
		target_hit = true

func reset():
	time = 0.0
	is_running = false
	target_hit = false
	position.x = 0
	position.y = 950

func start():
	time = 0.0
	is_running = true


func _on_angle_slider_value_changed(value):
	$Sprite.rotation = PI/2.0
	alpha = deg2rad(value)
	$Sprite.rotate(-alpha)


func _on_velocity_slider_value_changed(value):
	v0 = value

func pixels_to_meters(p):
	var pixels_per_meter = size_in_meters / get_viewport().size.y

	return pixels_per_meter * p

func meters_to_pixels(m):
	var meters_per_pixel =  get_viewport().size.y / size_in_meters

	return meters_per_pixel * m

