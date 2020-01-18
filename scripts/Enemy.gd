extends Node2D

const BattleUnits = preload("res://BattleUnits.tres")

export(int) var hp = 25 setget set_hp
export(int) var damage = 3
var target = null

onready var hplabel = $HPLabel
onready var animationplayer = $AnimationPlayer

signal died
signal end_turn

func set_hp(new_hp):
	hp = new_hp
	if hplabel != null:
		hplabel.text = str(hp)+"hp"
	
	if hp <= 0:
		emit_signal("died")
		queue_free()

func deal_damage():
	BattleUnits.PlayerStats.hp -= damage

func attack() -> void:
	yield(get_tree().create_timer(0.4), "timeout")
	animationplayer.play("Attack")
	yield(animationplayer, "animation_finished")
	emit_signal("end_turn")

func take_damage(amount):
	self.hp -= amount
	if is_dead():
		emit_signal("died")
		queue_free()
	else:
		animationplayer.play("Shake")

func is_dead():
	return hp <= 0

func _ready():
	BattleUnits.Enemy = self

func _exit_tree():
	BattleUnits.Enemy = null