extends Node2D

var noise = preload("res://scripts/softnoise.gd")
var block = preload("res://instances/Block.tscn")

enum block_types {
	GRASS, DIRT, STONE, BEDROCK
}

var world_depth = 10
var surface_height = 60
var chunk_width = 60

func _ready():
	var softnoise = noise.SoftNoise.new(2342342341234)
	for x in range(0, chunk_width):
		var y = floor(softnoise.openSimplex2D((get_global_transform().origin.x / 128 + x) * .1, 0) * surface_height * .2)
		new_block(Vector2(x*128,y*128), GRASS)
		
		#
		var stone_y = floor(softnoise.openSimplex2D((get_global_transform().origin.x / 128 + x) * .1, 32) * 4)
		
		#below the grass rock
		for yy in range(y+1, world_depth):
			if yy > world_depth*.25+stone_y:
				new_block(Vector2(x*128,yy*128), STONE)
			else:
				new_block(Vector2(x*128,yy*128), DIRT)
	pass
	
func new_block(pos, type):
	var new_block = block.instance()
	new_block.translate(pos)
	new_block.block_type = type
	add_child(new_block)