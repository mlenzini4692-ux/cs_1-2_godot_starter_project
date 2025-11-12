extends CharacterBody2D
var in_range = false
var chasing = false
var melee = false
var health = 3
var xspeed = 15
var yspeed = 15
var projectile_scene = preload("res://scenes/enemy_arrow.tscn")
var direction
var facing
var start_time = 1
var timer = start_time
var melee_timer = start_time
@onready var player: CharacterBody2D = %Player
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	pass

func _process(_delta: float) -> void:
	if player!=null:
		direction = (player.position-position).normalized()
		velocity.x = xspeed*direction.x * _delta
		velocity.y = yspeed*direction.y * _delta
		
		if abs(position.x - player.position.x)< abs(position.y - player.position.y):
			
			if position.y < player.position.y:
				facing = "down"
			else:
				facing = "up"
		else:
			if position.x > player.position.x:
				facing = "left"
			else:
				facing = "right"
				
		
		
		
		
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
			sprite.play("walk_" + facing)
		
				
		if melee:
			melee_timer -= _delta
			if melee_timer<0:
				sprite.play("attack_" + facing)
				melee_timer = start_time
				print("attacking")
		move_and_slide()
	
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
