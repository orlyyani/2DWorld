extends KinematicBody2D

const GRAVITY = 200.0
const WALK_SPEED = 200

var velocity = Vector2()

signal direction_changed(new_direction)

var look_direction = Vector2(1, 0) setget set_look_direction

#func take_damage(attacker, amount, effect=null):
#	if self.is_a_parent_of(attacker):
#		return
#	$States/Stagger.knockback_direction = (attacker.global_position - global_position).normalized()
#	$Health.take_damage(amount, effect)

#func set_dead(value):
#	set_process_input(not value)
#	set_physics_process(not value)
#	$CollisionPolygon2D.disabled = value

func set_look_direction(value):
	look_direction = value
	emit_signal("direction_changed", value)

#func _ready():
#	set_process_input(true)

#func _physics_process(delta):
#	velocity.y += delta * GRAVITY
#
#	if Input.is_action_pressed("ui_left"):
#		velocity.x = -WALK_SPEED
#	elif Input.is_action_pressed("ui_right"):
#		velocity.x =  WALK_SPEED
#	elif Input.is_action_pressed("ui_up"):
#		velocity.y = -WALK_SPEED
#	elif Input.is_action_pressed("ui_down"):
#		velocity.y = WALK_SPEED
#	else:
#		velocity.x = 0

	# We don't need to multiply velocity by delta because MoveAndSlide already takes delta time into account.

	# The second parameter of move_and_slide is the normal pointing up.
	# In the case of a 2d platformer, in Godot upward is negative y, which translates to -1 as a normal.
#	move_and_slide(velocity, Vector2(0, -1))

#func _process(delta): 
#	if Input.is_key_pressed(KEY_X):
#		print("left key pressed")
