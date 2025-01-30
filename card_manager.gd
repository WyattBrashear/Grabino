extends Node2D

# Function to initialize cards
func initialize_cards(deck):
	for i in range(deck.size()):
		var card_data = deck[i]
		var card_scene = preload("res://Card.tscn")  # Path to the Card scene
		var card_instance = card_scene.instantiate()
		card_instance.set_card_data(card_data)
		add_child(card_instance)
		card_instance.position = Vector2(100 * i, 0)  # Adjust positions as needed
