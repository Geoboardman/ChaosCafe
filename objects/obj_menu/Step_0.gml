/// Step Event (obj_Menu)
var mx = mouse_x;
var my = mouse_y;

menu_x = global.camera_x_position;

//if mouse_wheel_up() and item_xoffset < item_move_right_limit {
//	item_xoffset += item_scroll_speed;
//} else if mouse_wheel_down() and item_xoffset > item_scroll_speed {
//	item_xoffset -= item_scroll_speed;
//}

// Mouse Pressed: Check if clicked on a menu item
if (mouse_check_button_pressed(mb_left) && my >= menu_y) {
    for (var i = 0; i < array_length(menu_items); i++) {
        var x_pos = menu_x + (i * item_spacing) + 40;
        var y_pos = menu_y + menu_height / 2;

        if (point_distance(mx, my, x_pos, y_pos) < 20) and global.money >= price_list[i] {
            selected_item = i;
            dragging = true;

            // Create a temporary draggable object
            drag_obj = instance_create_layer(mx, my, "walls", obj_dragging);
            drag_obj.price = price_list[i];
            drag_obj.sprite_index = menu_sprites[selected_item];
            drag_obj.selected_index = selected_item; // Store which object it is
            break;
        }
    }
}

// Mouse Released: Drop the object
if (mouse_check_button_released(mb_left) && dragging) {
    dragging = false;
    if (drag_obj != noone and instance_exists(drag_obj)) {
        if (drag_obj.y < menu_y) {
            // Convert it into a placed furniture object
            var placed_obj = instance_create_layer(drag_obj.x, drag_obj.y, "walls", obj_furniture);
            placed_obj.sprite_index = menu_sprites[drag_obj.selected_index];
        }
        instance_destroy(drag_obj);
    }
    selected_item = -1;
}