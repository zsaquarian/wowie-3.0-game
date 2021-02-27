extends StaticBody2D

export var text = ""
export var prompt: bool
export var prompt_string: String
onready var label = $Label
onready var collision = $CollisionShape2D
var font = DynamicFont.new()

func _ready():
	font.font_data = load("res://assets/font/VT323-Regular.ttf")
	font.size = 40
	label.set("custom_fonts/font", font)

func _process(_delta):
	if label.text != text_with_prompt():
		update_label()

func update_label():
	label.text = text_with_prompt()
	var size = font.get_string_size(text_with_prompt())
	label.rect_size.x = size.x
	label.rect_size.y = size.y - 10

	label.rect_position.x = -size.x / 2
	label.rect_position.y = -size.y / 2 - 5

	collision.shape.set_extents(Vector2(size.x / 2, size.y / 2))

func text_with_prompt():
	return prompt_string + " " + text if prompt else text
