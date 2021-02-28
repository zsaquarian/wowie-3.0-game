extends StaticBody2D

export (String, MULTILINE) var text
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
	var lines = len(text_with_prompt().split("\n"))
	label.text = text_with_prompt()
	var size = font.get_string_size(text_with_prompt())
	var max_line_length = -1

	for i in lines:
		var temp = font.get_string_size(text_with_prompt().split("\n")[i]).x
		if temp > max_line_length:
			max_line_length = temp

	size.x = max_line_length

	print(size.x, ", ", size.y)
	# Force label to be at the center of the parent
	label.rect_size.x = size.x
	label.rect_size.y = size.y
	if lines > 1:
		label.rect_position.y = -size.y / 2
	# Change collision shape extents to match word size
	#$CollisionShape2D.get_shape().extents = Vector2(size.x / 2, size.y / 2)
	# ^^^^ Can't do this, because it affects all words in the scene
	# Make a new collision shape for this word
	size.y *= lines
	var shape = RectangleShape2D.new()
	shape.set_extents(Vector2(size.x, size.y / 2))
	collision.set_shape(shape)
	collision.one_way_collision = true

func text_with_prompt():
	return prompt_string + " " + text if prompt else text
