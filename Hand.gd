extends Control
class_name Hand

# List to hold the cards in the player's hand
var hand_cards = []

# Add a card to the hand
func add_card(card):
	hand_cards.append(card)
	add_child(card)
	update_hand_positions()

# Remove a card from the hand
func remove_card(card):
	hand_cards.erase(card)
	remove_child(card)
	update_hand_positions()

# Update the positions of the cards in the hand
func update_hand_positions():
	var spacing = 100
	for i in range(hand_cards.size()):
		hand_cards[i].position = Vector2(spacing * i, 0)
