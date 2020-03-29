extends "on_ground.gd"
export(float) var GRAVITY = 1600.0

func enter():
	velocity = Vector2()
	#owner.get_node("AnimationPlayer").play("idle")
	pass

func handle_input(event):
	return .handle_input(event)

func update(delta):
	velocity.y += delta * GRAVITY
	var input_direction = get_input_direction()
	if input_direction:
		emit_signal("finished", "move")
	owner.move_and_slide(velocity, Vector2(0, -1))
