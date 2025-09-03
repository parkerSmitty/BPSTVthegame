extends Node
class_name Inventory


#an array of {item: item, amount: int}
var items: Array = []

signal inventory_updated

func add_item(item: Item, amount: int = 1):
	if item == null:
		push_error("tried to add null item to inventory")
	if item.stackable:
		for entry in items:
			if entry.item.id == item.id:
				item.amount += amount
				emit_signal("inventory_updated")
				return
	items.append({ "item": item, "amount": amount})
	emit_signal("inventory_updated")
	print("inventory_updated")
	print(item.name, " was added to inventory")
	

func remove_item(item_id: String, amount: int = 1):
	for entry in items:
		if entry.item.id == item_id:
			entry.amount -= amount
			if entry.amount <= 0:
				items.erase(entry)
			emit_signal("inventory_updated")
			return

func get_items() -> Array:
	return items


		
