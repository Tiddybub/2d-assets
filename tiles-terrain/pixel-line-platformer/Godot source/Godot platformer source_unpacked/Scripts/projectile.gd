extends AnimatedSprite

var direction = 0
var speed = 20
var timer = 0

func _ready():
	
	scale = Vector2(0.5, 0.25)
	playing = true

func _process(delta):
	
	timer += delta
	if timer > 0.5: queue_free()
	
	scale = scale.linear_interpolate(Vector2(1, 1), delta * 12)
	
	if direction == 0:
		position -= Vector2(speed * 10 * delta, 0)
		flip_h = true
	else:
		position += Vector2(speed * 10 * delta, 0)
		flip_h = false

func _on_Area2D_body_entered(body):
	
	if body.has_method("hit"):
		body.hit()
		queue_free()
