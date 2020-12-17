extends Node

onready var scene_tree = get_tree()
onready var my_pauseOverlay: ColorRect = get_node("PauseOverlay")
onready var score: Label = get_node("Label")
onready var pauseTitle: Label = get_node("PauseOverlay/Title")

var paused: bool = false setget set_paused

func _ready():
	PlayerData.connect("player_died", self, "_on_PlayerData_player_died")
	PlayerData.connect("score_updated", self, "update_interface")
	update_interface()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		self.paused = not paused
		scene_tree.set_input_as_handled()

func _on_PlayerData_player_died() -> void:
	self.paused = true
	pauseTitle.text = "You died!"

func set_paused(value: bool):
	paused = value
	scene_tree.paused = value
	my_pauseOverlay.visible = value

func update_interface():
	score.text = "Score: %s" % PlayerData.score
