extends Camera2D

var main_char = preload("res://instances/Player.tscn")
var cam_speed = 10

func _fixed_process(delta):
	var target_pos = (get_node("Player").instance().get_global_pos()) * 0.5
	set_global_pos(get_global_pos().linear_interpolate(target_pos, cam_speed * delta))

#func _ready():
#	set_process(true)
#	pass
	
#func _process(delta):
#	if Input.is_action_pressed('ui_up'):
#		translate(Vector2(0, -cam_speed))
#	if Input.is_action_pressed('ui_down'):
#		translate(Vector2(0, cam_speed))
#	if Input.is_action_pressed('ui_left'):
#		translate(Vector2(-cam_speed, 0))
#	if Input.is_action_pressed('ui_right'):
#		translate(Vector2(cam_speed, 0))
