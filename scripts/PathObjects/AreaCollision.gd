extends Area2D

var inside_body = false

func _ready():
	set_process_input(true)
	self.connect("body_entered", self, "bodyEntered")
	self.connect("body_exited", self, "bodyExit")

func bodyEntered(body):
#	if body.is_in_group("player"):
	print('entered')
	inside_body = true

func bodyExit(body):
	print ('exit')
	inside_body = false

func _process(delta):
	if(Input.is_key_pressed(KEY_X) && inside_body):
		print (self.position)
		self.queue_free()