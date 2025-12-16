extends Sprite2D

@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageComponent = $DamageComponent

var log_scene : PackedScene = preload("res://scenes/objects/trees/log.tscn")


func _ready() -> void:
	hurt_component.hurt.connect(on_hurt)
	damage_component.max_damage_reached.connect(on_max_damage_reached)

func on_hurt(damage: int) -> void:
	damage_component.apply_damage(damage)


func on_max_damage_reached() -> void:
	call_deferred("drop_log")
	print("Max damage reached.")
	queue_free()


func drop_log() -> void:
	var log_instance = log_scene.instantiate() as Node2D
	log_instance.position = position
	get_parent().add_child(log_instance)
