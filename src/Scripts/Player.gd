extends KinematicBody2D

export var speed : float = 500.0
var velocity : Vector2 = Vector2()

var isdead : bool = false

export (PackedScene) var bull
onready var Bull_Container = get_node("mc")

func _shoot():
	var pew = bull.instance()
	owner.add_child(pew)
	pew.transform = $Muzzle.global_transform

func get_input() -> void:
	velocity = Vector2()
	if Input.is_action_pressed("up"):
		velocity.y = -speed
	if Input.is_action_pressed("down"):
		velocity.y = speed
	if Input.is_action_pressed("left"):
		velocity.x = -speed
	if Input.is_action_pressed("right"):
		velocity.x = speed

func _ready():
	yield(get_tree(), "idle_frame")
	get_tree().call_group("Zombie", "set_player", self)
	set_process(true)

func _process(delta):
	if !isdead:
		var mouse_pos = get_viewport().get_mouse_position()
		look_at(mouse_pos)
		get_input()
		if Input.is_action_just_pressed("click"):
			_shoot()
		move_and_slide(velocity)
	


func _on_ZombieDetector_body_entered(body):
	if body.is_in_group("Zombie"):
		PlayerData.deaths += 1
		get_node("mayat").visible = true
		get_node("mc").visible = false
		isdead = true
		
