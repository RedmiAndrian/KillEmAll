extends Node

onready var theParent: = get_node(".")

func _ready():
	get_tree().paused = false
	spawnZombie()

func spawnZombie():
	var zombieScene = load("res://src/Actors/Zombie.tscn")
	var zombie = zombieScene.instance()
	var rand = RandomNumberGenerator.new()
	var screenSize = get_viewport().get_visible_rect().size
	rand.randomize()
	var x = rand.randf_range(0, screenSize.x)
	rand.randomize()
	var y = rand.randf_range(0, screenSize.y)
	zombie.position.y = y
	zombie.position.x = x
	add_child(zombie)

func _physics_process(delta):
	if !theParent.has_node("Zombie"):
		spawnZombie()
