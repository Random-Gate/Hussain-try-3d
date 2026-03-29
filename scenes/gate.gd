extends Area3D

@onready var player: CharacterBody3D = $"../CharacterBody3D"
var isGateOpen = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if overlaps_body(player) and Input.is_action_just_pressed("Up"):
		if player.points > 1 and not isGateOpen:
			openGate()
		
func openGate():
	position.y = position.y -1
	isGateOpen = true
