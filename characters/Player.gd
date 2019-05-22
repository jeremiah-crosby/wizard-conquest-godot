extends KinematicBody2D

class_name Projectile

const BASE_SPEED = 300
const SPELL_OFFSET_X = 30
const SPELL_OFFSET_Y = -15

const Fireball = preload("res://spells/fireball/Fireball.tscn")
const Earthquake = preload("res://spells/earthquake/Earthquake.tscn")
const DamageSource = preload("res://common/DamageSource.gd")

func _ready():
	$Health.connect("died", self, "on_died")
	
func on_died():
	queue_free()

func _physics_process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("play_move_left"):
		velocity.x = -1
	
	if Input.is_action_pressed("play_move_right"):
		velocity.x = 1
		
	if Input.is_action_pressed("play_move_down"):
		velocity.y = 1
	
	if Input.is_action_pressed("play_move_up"):
		velocity.y = -1
		
	if Input.is_action_just_pressed("play_spell_1"):
		fire_spell_1()
		
	if Input.is_action_just_pressed("play_spell_2"):
		fire_spell_2()
	
		
	self.move_and_slide(velocity.normalized() * BASE_SPEED)
	
func fire_spell_1():
	var fireball = Fireball.instance()
	fireball.position = position + Vector2(SPELL_OFFSET_X, SPELL_OFFSET_Y)
	get_parent().add_child(fireball)
	
func fire_spell_2():
	var earthquake = Earthquake.instance()
	earthquake.initialize(self)
	add_child(earthquake)
