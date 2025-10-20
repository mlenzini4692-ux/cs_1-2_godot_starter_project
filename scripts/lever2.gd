extends Area2D


@onready var radius: CollisionShape2D = $Area2D/radius
var current_lever
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var in_range = false
var on = false
var player
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_select")and in_range == true:
		on=true
		animated_sprite_2d.play("on")
		print ("lever on")
	if Input.is_action_just_pressed("ui_select")and in_range == false:
		
		on=false
		animated_sprite_2d.play("off")
func _on_body_entered(body: Area2D):
	if body.name == "Player":
		in_range = true
func _on_area_2d_body_entered(body: Node2D) -> void:
	# TODO: Check if the body is the player
	if body.name == "Player":
	# Update player detection state
		in_range=true
		player = body
func _on_area_2d_body_exited(body: Node2D) -> void:
	# TODO: Check if the body is the player
	if body.name == "Player":
	# Update player detection state
		in_range=false
		player = null
