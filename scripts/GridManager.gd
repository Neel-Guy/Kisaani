extends Node2D

@export var plot_scene: PackedScene = preload("res://components/Plot.tscn")

var grid_size = Vector2i(4, 4)
var tile_size = 105   # The width of your actual sprite
var gap = 12          # The physical pixels between the edges
var padding = Vector2(64, 64) # Offset from the top-left of the viewport

func _ready():
	# Step is the distance from center to center
	var step = tile_size + gap
	
	for x in range(grid_size.x):
		for y in range(grid_size.y):
			var plot = plot_scene.instantiate()
			
			# Since the origin is (0,0) at the center:
			# Position = (index * distance_between_centers) + padding
			var pos_x = (x * step) + padding.x
			var pos_y = (y * step) + padding.y
			
			plot.position = Vector2(pos_x, pos_y)
			add_child(plot)
