extends KinematicBody2D

var target = null
var mark = 100
export var health = 3
export var speed = 300

func _ready():
	add_to_group("Zombie")

func _physics_process(delta):
	if health <= 0:
		die()
	if target:
		look_at(target.global_position)
		var velocity = global_position.direction_to(target.global_position)
		move_and_collide(velocity * speed * delta)

func _on_PlayerDetector_body_entered(body):
	if body.name == "MainCharacter":
		print("BRAINZ...")
		target = body


func _on_PlayerDetector_body_exited(body):
	if body.name == "MainCharacter":
		target = null


func _on_BulletDetector_body_entered(body):
	if body.is_in_group("Bullet"):
		health -= 1
		body.queue_free()
		
func die():
	PlayerData.score += mark
	print(PlayerData.score)
	queue_free()
