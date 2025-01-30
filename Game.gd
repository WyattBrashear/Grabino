extends Node2D

var deck_node: Deck
var hand_node: Control
var card_manager: Node2D

func _ready():
	deck_node = $DeckNode
	hand_node = $HandNode
	card_manager = $CardManager

	if deck_node:
		deck_node.initialize_deck()
		deck_node.shuffle_deck()

		# Deal cards to the player's hand
		for i in range(5):
			var card_data = deck_node.draw_card()
			if card_data:
				var card_scene = preload("res://Card.tscn")  # Correct path to the card scene
				var card_instance = card_scene.instantiate()
				
				# Set card data
				card_instance.set_card_data(card_data)
				
				hand_node.add_child(card_instance)  # Add card to the player's hand
				# Optionally position the cards in the hand
				card_instance.position = Vector2(100 * i, 0)  # Adjust positions as needed

		# Initialize cards in the CardManager
		card_manager.initialize_cards(deck_node.cards)
