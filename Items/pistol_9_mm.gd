extends RigidBody3D

@export var item_data: Item
@export var amount: int = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func collect(by_who):
	if by_who.has_method("get_inventory"):
		var inventory = by_who.get_inventory()
		print("inventory =", inventory)
		print("inventory node is of type: ", inventory.get_class())
		print("has add_item()? ", inventory.has_method("add_item"))
		inventory.add_item(item_data, amount)
		queue_free()
