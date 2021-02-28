extends Node2D

var triggered = false

func _ready():
	$Label.percent_visible = 0
	$Label2.percent_visible = 0
	$Label3.percent_visible = 0
	$Triggers/Trigger1.connect("body_entered", self, "_trigger_1")
	$Triggers/Trigger2.connect("body_entered", self, "_trigger_2")
	$Triggers/Trigger3.connect("body_entered", self, "_trigger_3")

func _trigger_1(body):
	if body.name == "Player" and not triggered:
		$Triggers/Trigger1.disconnect("body_entered", self, "_trigger_1")
		$AnimationPlayer.play("ShowText1")
		triggered = true

func _trigger_2(body):
	if body.name == "Player" and not triggered:
		$Triggers/Trigger2.disconnect("body_entered", self, "_trigger_2")
		$AnimationPlayer.play("ShowText2")
		triggered = true

func _trigger_3(body):
	if body.name == "Player" and not triggered:
		$Triggers/Trigger3.disconnect("body_entered", self, "_trigger_3")
		$AnimationPlayer.play("ShowText3")
		triggered = true

func _on_animation_finished(_anim_name):
	triggered = false
