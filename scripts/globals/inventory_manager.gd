extends Node

var inventory : Dictionary = {}

signal inventory_changed


func add_collectable(collectable_name: String):
    if collectable_name in inventory:
        inventory[collectable_name] += 1
    else:
        inventory[collectable_name] = 1

    inventory_changed.emit()