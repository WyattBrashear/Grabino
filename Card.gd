extends Control
class_name Card

# Reference to the card data
var card_data: CardData

# Function to set the card data
func set_card_data(data: CardData):
	card_data = data
	update_card()

# Update the card display based on the data
func update_card():
	# Ensure the Sprite2D node is valid and update the texture
	if $Sprite2D:
		$Sprite2D.texture = preload("res://Cards/2.jpg")  # Replace with actual path
	# Update other visual elements as needed
	print("Card suit:", card_data.suit)
	print("Card rank:", card_data.rank)

# Dragging logic
var is_dragging = false
var drag_offset = Vector2()

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				# Ensure the Area2D node is valid before accessing its methods
				if $Area2D and $Area2D.get_global_rect().has_point(event.position):
					is_dragging = true
					drag_offset = event.position - global_position
			else:
				is_dragging = false
	elif event is InputEventMouseMotion and is_dragging:
		global_position = event.position - drag_offset
