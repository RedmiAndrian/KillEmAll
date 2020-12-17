extends KinematicBody2D

var direction : Vector2 = Vector2()
export var speed : float = 1000.0

func _ready():
	add_to_group("Bullet")

func _process(delta):
	position += transform.x * speed * delta
