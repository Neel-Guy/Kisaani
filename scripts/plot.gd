extends Area2D


enum State { EMPTY, GROWING, READY }
var current_state = State.EMPTY

var ready_timestamp: int = 0
var growth_time: int = 5 # Placeholder: 5 seconds

func _ready():
	update_visuals()

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		handle_click()

func handle_click():
	match current_state:
		State.EMPTY:
			start_growth()
		State.READY:
			harvest()

func start_growth():
	current_state = State.GROWING
	ready_timestamp = Time.get_unix_time_from_system() + growth_time
	update_visuals()

func harvest():
	current_state = State.EMPTY
	Global.money += 50 # Add money to the global store
	update_visuals()

func _process(_delta):
	if current_state == State.GROWING:
		if Time.get_unix_time_from_system() >= ready_timestamp:
			current_state = State.READY
			update_visuals()

func update_visuals():
	$Label.text = State.keys()[current_state]
	match current_state:
		State.EMPTY: $Sprite2D.modulate = Color.DARK_GRAY
		State.GROWING: $Sprite2D.modulate = Color.YELLOW
		State.READY: $Sprite2D.modulate = Color.GREEN
