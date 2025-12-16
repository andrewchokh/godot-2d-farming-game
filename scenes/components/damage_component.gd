class_name DamageComponent
extends Node2D

@export var max_damage : int = 1
@export var current_damage : int = 0

signal max_damage_reached


func apply_damage(damage: int) -> void:
	current_damage += clamp(damage, 0, max_damage)

	print("Current Damage: %d / %d" % [current_damage, max_damage])

	if current_damage >= max_damage:
		max_damage_reached.emit()