extends Sprite2D

@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageComponent = $DamageComponent


func _ready() -> void:
	hurt_component.hurt.connect(on_hurt)
	damage_component.max_damage_reached.connect(on_max_damage_reached)

func on_hurt(damage: int) -> void:
	damage_component.apply_damage(damage)


func on_max_damage_reached() -> void:
	print("Max damage reached, removing tree.")
	queue_free()
