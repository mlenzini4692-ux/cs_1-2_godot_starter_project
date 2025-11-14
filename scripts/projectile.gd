extends Area2D

# TODO: Add speed variable for how fast projectile moves
var speed = 400
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

# TODO: Add direction variable to store which way to move
var direction = Vector2(1,0)
var is_attacking
var current_enemy
func _physics_process(_delta):
	# TODO: Calculate movement using direction and speed
	# Similar to player movement: velocity = direction * speed
	position += speed * direction * _delta
	
	if Input.is_action_just_pressed("ui_select"):
		is_attacking = true	
	
	if current_enemy != null and is_attacking:
			current_enemy.queue_free()
	# TODO: Apply the movement
	# Use: move_and_slide()
	#move_and_slide()
	
	# TODO: Print movement for debugging
	# print("Projectile moving: ", velocity)
	#print("Projectile moving:", velocity)
	

# TODO: Create function to set projectile direction
func set_direction(_facing : String):
	# TODO: Convert facing string to Vector2 direction
	# Use if statements: "up" -> Vector2.UP, "down" -> Vector2.DOWN, etc.
	# Set direction = the Vector2 result
	if _facing == "up":
		direction = Vector2.UP
	elif _facing == "down":
		direction = Vector2.DOWN
	elif _facing == "right":
		direction = Vector2.RIGHT
	elif _facing == "left":
		direction = Vector2.LEFT
	# TODO: Print the direction for debugging
	# print("Projectile direction set to: ", direction)
	print("projectile is facing " + _facing) 
	


func _on_melee_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		current_enemy = body
		print("enemy got shot!")
		
		
func _on_melee_body_exited(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		current_enemy = null


func _on_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
