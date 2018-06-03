extends StaticBody2D

var block_sprites = [
	preload("res://sprites/Tiles/dirt_grass.png"),
	preload("res://sprites/Tiles/dirt.png"),
	preload("res://sprites/Tiles/greystone.png"),
	preload("res://sprites/Tiles/gravel_stone.png")
]

var block_type

func _ready():
	get_node("Sprite").texture = block_sprites[block_type]
	pass