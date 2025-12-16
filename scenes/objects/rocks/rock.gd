extends Sprite2D

@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageComponent = $DamageComponent

var stone_scene : PackedScene = preload("res://scenes/objects/rocks/stone.tscn")


func _ready() -> void:
	hurt_component.hurt.connect(on_hurt)
	damage_component.max_damage_reached.connect(on_max_damage_reached)

func on_hurt(damage: int) -> void:
	damage_component.apply_damage(damage)

	material.set_shader_parameter("shake_intensity", 0.25)
	await get_tree().create_timer(0.4).timeout
	material.set_shader_parameter("shake_intensity", 0.0)


func on_max_damage_reached() -> void:
	call_deferred("drop_stone")
	print("Max damage reached.")
	queue_free()


func drop_stone() -> void:
	var stone_instance = stone_scene.instantiate() as Node2D
	stone_instance.position = position
	get_parent().add_child(stone_instance)