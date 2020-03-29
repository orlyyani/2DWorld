extends Node2D

var noise = preload("res://scripts/softnoise.gd")
var block = preload("res://instances/Block.tscn")
var path_object = preload("res://instances/PathWays.tscn")
var main_char = preload("res://instances/Player.tscn")
var grass_object = preload("res://instances/PathObjects/Area2d/Grass.tscn")

enum block_types {
	GRASS, DIRT, STONE, BEDROCK
}

var world_depth = 10
var surface_height = 60
var chunk_width = 60
var walkable_surface = []
var total_objects = 60
var covered_objects = []

func _ready():
	var softnoise = noise.SoftNoise.new(2342342341234)
	for x in range(0, chunk_width):
		var y = floor(softnoise.openSimplex2D((get_global_transform().origin.x / 128 + x) * .1, 0) * surface_height * .2)
		walkable_surface.append(y-1)
		new_block(Vector2(x*128,y*128), block_types.GRASS)
		
		#
		var stone_y = floor(softnoise.openSimplex2D((get_global_transform().origin.x / 128 + x) * .1, 32) * 4)
		
		#below the grass rock
		for yy in range(y+1, world_depth):
			if yy > world_depth*.25+stone_y:
				new_block(Vector2(x*128,yy*128), block_types.STONE)
			else:
				new_block(Vector2(x*128,yy*128), block_types.DIRT)
	
	randomize()
	var res_x = randi()%60
	var res_y = randi()%60
	
	generate_covered_objects()
	random_path_objects()
	
	for i in range(0, 20):
		randomize()
#		generate_path_objects(Vector2(covered_objects[i]*128, walkable_surface[covered_objects[i]]*128), randi()%5)
		generate_area_objects(Vector2(covered_objects[i]*128, walkable_surface[covered_objects[i]]*128))
		
	generate_main_char(Vector2(res_x*128,walkable_surface[res_x]*128))
	pass
	
func new_block(pos, type):
	var new_block = block.instance()
	new_block.translate(pos)
	new_block.block_type = type
	add_child(new_block)
	
func generate_path_objects(pos, type):
	var new_object = path_object.instance()
	new_object.translate(pos)
	new_object.path_way_type = type
	add_child(new_object)

func generate_area_objects(pos):
	var new_object = grass_object.instance()
	new_object.translate(pos)
	add_child(new_object)
	
func generate_main_char(pos):
	var character = main_char.instance()
	character.translate(pos)
	add_child(character)
	
func generate_covered_objects():
	for i in range(total_objects):
		covered_objects.append(i)
		
func random_path_objects():
	randomize()
	
	for i in range(total_objects):
		var swap_val = covered_objects[i]
		var swap_indx = int(rand_range(i, total_objects))
		
		covered_objects[i] = covered_objects[swap_indx]
		covered_objects[swap_indx] = swap_val
	print (covered_objects)
