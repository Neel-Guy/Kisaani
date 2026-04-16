extends Label

func _ready():
	# Update initially
	text = "Money: $" + str(Global.money)
	# Listen for future changes
	Global.money_changed.connect(_on_money_changed)

func _on_money_changed(new_amount):
	text = "Money: $" + str(new_amount)
