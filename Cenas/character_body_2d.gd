extends CharacterBody2D

@export_category("Variables")
@export var _move_speed: float = 215
#@export var _run_speed_multiplier: float = 2.0

@export var _acceleration: float = 0.8
@export var _friction: float = 0.4

@export_category("Objects")
@export var _animation_tree: AnimationTree = null

@onready var all_interactions = [] # this is useful as an array cause I can have more than one interaction happening at once.
@onready var interactLabel = $"InteractionComponents/InteractLabel" 

func _ready() -> void:
	var _state_machine = _animation_tree["parameters/playback"]
	update_interactions()

func _physics_process(_delta: float) -> void:
	_move()
	_animate()
	move_and_slide()
	#print("this is the all interactions: ", all_interactions) printou: "this is the all interactions: [interactionCircle:<Area2D#28974253319>]"

	#then
	for i in all_interactions:
		if i.interact_type == "Lock" and Input.is_key_pressed(KEY_F):
			get_tree().change_scene_to_file("res://Cenas/control.tscn")
		if i.interact_type == "Miror" and Input.is_key_pressed(KEY_F):
			get_tree().change_scene_to_file("res://Cenas/imagem_espelho.tscn")

func _move() -> void:
	var _direction: Vector2 = Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
	)
	
	var _run_speed_multiplier
	if _direction != Vector2.ZERO:
		
		_animation_tree["parameters/idle/blend_position"] = _direction
		_animation_tree["parameters/walk/blend_position"] = _direction
		if Input.is_key_pressed(KEY_SHIFT):
			_run_speed_multiplier = 2
		else:
			_run_speed_multiplier = 1
		velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed * _run_speed_multiplier, _acceleration)
		velocity.y = lerp(velocity.y, _direction.normalized().y * _move_speed * _run_speed_multiplier, _acceleration)
		return

	velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _friction)
	velocity.y = lerp(velocity.y, _direction.normalized().y * _move_speed, _friction)
	
func _animate() -> void:
	var _state_machine = _animation_tree["parameters/playback"]
	if velocity.length() > 2:
		_state_machine.travel("walk")
		return
	
	_state_machine.travel("idle")



#interaction methods ---------
func _on_interaction_area_area_entered(area):
	all_interactions.insert(0, area) #notice this is the area we've assigned as parameter so we can insert the area value into the array
	update_interactions()
	


func _on_interaction_area_area_exited(area):
	all_interactions.erase(area)
	update_interactions()

func update_interactions():
	if all_interactions: 
		interactLabel.text = all_interactions[0].interact_label
	else:
		interactLabel.text = ""
