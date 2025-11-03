extends CharacterBody2D
var in_range = false
var chasing = false
var melee = false
var health = 3
var speed = 150

@onready var player: CharacterBody2D = %Player
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	pass

func _process(_delta: float) -> void:
	if melee and !chasing and !in_range:
		if name == "MeleeMinotaur":
			pass
	elif !melee and chasing and !in_range:
		if name == "MeleeMinotaur":
			pass
	elif !melee and !chasing and in_range:
		if name == "MeleeMinotaur":
			pass
	elif !melee and !chasing and !in_range:
		if name == "MeleeMinotaur":
			pass

			
func _on_melee_body_entered(body: Node2D) -> void:
	if body.name =="Player":
		in_range=false
		chasing=false
		melee=true
		
func _on_melee_body_exited(body: Node2D) -> void:
	if body.name =="Player":
		in_range=false
		chasing=true
		melee=false
		
func _on_chase_body_entered(body: Node2D) -> void:
	if body.name =="Player":
		in_range=false
		chasing=true
		melee=false
		
func _on_chase_body_exited(body: Node2D) -> void:
	if body.name =="Player":
		in_range = true
		chasing=false
		melee=false
		
func _on_range_body_entered(body: Node2D) -> void:
	if body.name =="Player":
		in_range = true
		chasing = false
		melee = false
		
func _on_range_body_exited(body: Node2D) -> void:
	if body.name =="Player":
		in_range = false
		chasing = false
		melee = false

func update_animation():
	if melee == true:
		animated_sprite_2d.play("attack_ + facing")
			
#Things we need (maybe)
	#if xDirection>0:
		#facing = "right"
		#melee_hitbox.position = Vector2(30,-15)
	#elif xDirection<0:
		#facing = "left"
		#melee_hitbox.position = Vector2(-30,-15)
	#elif yDirection >0:
		#facing = "down"	
		#melee_hitbox.position = Vector2(0,20)
	#elif yDirection <0:
		#facing = "up"	
		#melee_hitbox.position = Vector2(0,-45)
		
		#func update_animation():
	#if is_attacking == true:
		#_animation_player.play("attack_"+ facing)
	#elif xDirection == 0 && yDirection == 0:
		#_animation_player.play("idle_"+ facing)
	#else: _animation_player.play("walk_"+ facing)
