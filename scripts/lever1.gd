extends Area2D
@onready var radius: CollisionShape2D = $Area2D/radius
var current_lever
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var in_range = false
@export var on = false
@onready var player: CharacterBody2D = %Player
var trophy_scene = preload("res://scenes/trophy.tscn")

func _ready() -> void:
	animated_sprite_2d.play("off")

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_select")and in_range == true:
		if name == "Lever1":
			if player.lever1:
				player.lever1 = false
				animated_sprite_2d.play("off")
			else: 
				player.lever1 = true
				animated_sprite_2d.play("on")
		elif name == "Lever2":
			if player.lever2:
				player.lever2 = false
				animated_sprite_2d.play("off")
			else: 
				player.lever2 = true
				animated_sprite_2d.play("on")
		elif name == "Lever3":
			if player.lever3:
				player.lever3 = false
				animated_sprite_2d.play("off")
			else: 
				player.lever3 = true
				animated_sprite_2d.play("on")
		elif name == "Lever4":
			if player.lever4:
				player.lever4 = false
				animated_sprite_2d.play("off")
			else: 
				player.lever4 = true
				animated_sprite_2d.play("on")

	if player.lever1 and player.lever3 and !player.lever4 and !player.lever2:
		var trophy = trophy_scene.instantiate()
		get_parent().add_child(trophy)
		
		trophy.global_position = position + Vector2(100,400)
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
	if body.name == "Player":
		in_range=true
		print("Player in range")
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		in_range=false
		
		print("player out of range")
