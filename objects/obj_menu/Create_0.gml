/// @description Insert description here
// You can write your code in this editor
/// Create Event (obj_Menu)
menu_items = ["Cat Bed", "Cat Home", "Litter Box","CaT"]; // List of objects
menu_sprites = [spr_catbedblue, spr_cathomes, spr_litter_box,spr_IdleCatb]; // Corresponding sprites
price_list = [
	10,
	20,
	15,
	40,
]

menu_x = 0;
menu_y = room_height - 64; // Position menu at bottom
menu_width = room_width;
menu_height = 64
item_spacing = 80; // Distance between items

selected_item = -1; // -1 means no item is selected
dragging = false; // Tracks if the player is dragging
drag_obj = noone; // Reference to the dragged object