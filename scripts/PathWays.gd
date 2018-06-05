extends StaticBody2D

var path_way_sprites = [
	preload("res://sprites/Tiles/grass1.png"),
	preload("res://sprites/Tiles/grass2.png"),
	preload("res://sprites/Tiles/grass3.png"),
	preload("res://sprites/Tiles/wheat_stage1.png"),
	preload("res://sprites/Tiles/rock_moss.png")
]

var path_way_type

func _ready():
	get_node("Sprite").texture = path_way_sprites[path_way_type]
	pass