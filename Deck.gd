extends Node
class_name Deck

# Path to the CardData resources
var cards_folder_path = "res://Cards/"

# List to hold the deck of cards
var cards: Array

func _ready():
	initialize_deck()

# Initialize the deck with cards from the Cards folder
func initialize_deck():
	cards = []
	var dir = DirAccess.open(cards_folder_path)
	
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			print("Checking file:", file_name)  # Debug print
			if file_name.ends_with(".tres"):
				var card_data = parse_file_name(file_name)
				if card_data:
					cards.append(card_data)
					print("Loaded card data:", card_data.rank, "of", card_data.suit, "with effect:", card_data.effect)
				else:
					print("Failed to parse card data from file:", file_name)  # Debug print
			file_name = dir.get_next()
		dir.list_dir_end()
	else:
		print("Failed to open Cards folder:", cards_folder_path)
	print("Deck initialized with", cards.size(), "cards")

# Parse card data from file name
func parse_file_name(file_name: String) -> CardData:
	var card_data = CardData.new()
	
	# Remove the file extension
	var name = file_name.replace(".tres", "")
	
	# Extract rank and suit
	var rank_end_index = name.find("card")
	if rank_end_index == -1:
		return null  # Invalid file name format

	card_data.rank = name.substr(0, rank_end_index)
	card_data.suit = name.substr(rank_end_index + 4, name.length())
	
	# Set a default effect or parse it from the file if needed
	card_data.effect = "Default effect"  # Update as needed
	
	return card_data

# Shuffle the deck
func shuffle_deck():
	cards.shuffle()
	print("Deck shuffled")

# Draw a card from the deck
func draw_card() -> CardData:
	if cards.size() > 0:
		return cards.pop_front()
	else:
		print("No more cards in the deck")
		return null
