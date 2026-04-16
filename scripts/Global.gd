extends Node

signal money_changed(new_amount)

var money: int = 200:
	set(value):
		money = value
		money_changed.emit(money) # Automatically notifies the UI
