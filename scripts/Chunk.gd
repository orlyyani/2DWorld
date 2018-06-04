extends Node2D

var noise = preload("res://scripts/softnoise.gd")
var block = preload("res://instances/Block.tscn")
var main_char = preload("res://instances/Player.tscn")

enum block_types {
	GRASS, DIRT, STONE, BEDROCK
}

var world_depth = 10
var surface_height = 60
var walkable_surface = []
var chunk_width = 60

func _ready():
	var softnoise = noise.SoftNoise.new(2342342341234)
	for x in range(0, chunk_width):
		var y = floor(softnoise.openSimplex2D((get_global_transform().origin.x / 128 + x) * .1, 0) * surface_height * .2)
		walkable_surface.append(y+1)
		new_block(Vector2(x*128,y*128), GRASS)
		
		#
		var stone_y = floor(softnoise.openSimplex2D((get_global_transform().origin.x / 128 + x) * .1, 32) * 4)
		
		#below the grass rock
		for yy in range(y+1, world_depth):
			if yy > world_depth*.25+stone_y:
				new_block(Vector2(x*128,yy*128), STONE)
			else:
				new_block(Vector2(x*128,yy*128), DIRT)
	
	randomize()
	var res_x = randi()%60
	var res_y = randi()%60
	print(res_x)
	print(walkable_surface[res_x])
	print(walkable_surface)
	generate_main_char(Vector2(res_x*128,walkable_surface[res_x+1]*128))
	pass
	
func new_block(pos, type):
	var new_block = block.instance()
	new_block.translate(pos)
	new_block.block_type = type
	add_child(new_block)
	
func generate_main_char(pos):
	var character = main_char.instance()
	character.translate(pos)
	add_child(character)