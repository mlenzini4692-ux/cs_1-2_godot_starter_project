extends CharacterBody2D
var in_range = false
var chasing = false
var melee = false
var health = 3
var speed = 150
var projectile_scene = preload("res://scenes/enemy_arrow.tscn")
var direction = position
var facing
var start_time = 1
var timer = start_time
var melee_timer = start_time
@onready var player: CharacterBody2D = %Player
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	pass

func _process(_delta: float) -> void:
#be warned this will break the die func needs fixing	

	#if player.position.x < position.x:
	#	facing = "left"
	#elif player.position.x < position.x:
	#	facing = "right"
	#if player.position.y < position.y:
	#	facing = "up"
	#elif player.position.y < position.y:
	#	facing = "down"
		
	
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
	
	
	
	if in_range:
		direction = (player.position)
		timer -= _delta
		if timer<0:
			sprite.play("crossbow_shoot_" + facing)
			shoot()
			timer = start_time
			
	if chasing:
		pass
			
	if melee:
		melee_timer -= _delta
		
		if melee_timer<0:
			sprite.play("attack_" + facing)
			melee_timer = start_time
			print("attacking")
	
func _on_melee_body_entered(body: Node2D) -> void:
	if body.name =="Player":
		in_range=false
		chasing=false
		melee=true
		player = body
		
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


			
func shoot():
	var new_projectile = projectile_scene.instantiate()
	new_projectile.global_position = position
	get_parent().add_child(new_projectile)
	new_projectile.set_direction(player.position)
	if direction.x <0:
		scale.x *= -1
		
		
		
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
