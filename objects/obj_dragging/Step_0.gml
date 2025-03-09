/// Step Event (obj_Dragging)
x = mouse_x;
y = mouse_y;

// Delete the object if the player presses Delete or X
if (keyboard_check_pressed(vk_delete) || keyboard_check_pressed(ord("X"))) {
    instance_destroy();
}

// Drop the object on mouse release
if (mouse_check_button_released(mb_left)) {
    if (y <= obj_menu.menu_y - 16) and not place_meeting(x,y,obj_furniture)  { // Ensure it's not dropped inside the menu
		if sprite_index = spr_IdleCatb  {
			instance_create_layer(x, y, "cats", obj_cat);
		} else {
			var placed_obj = instance_create_layer(x, y, "Instances", obj_furniture);
			placed_obj.sprite_index = sprite_index;
			placed_obj.price = price;
		}
		global.money -= price;
    }
    instance_destroy();
}