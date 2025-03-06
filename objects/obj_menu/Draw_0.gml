/// Draw Event (obj_Menu)
draw_set_alpha(0.75);
draw_rectangle(menu_x, menu_y, menu_x + menu_width, menu_y + menu_height, false);
draw_set_alpha(1);

// Draw each menu item
for (var i = 0; i < array_length(menu_items); i++) {
    var x_pos = menu_x + (i * item_spacing) + 40; // Position each item
    var y_pos = menu_y + menu_height / 2;

    draw_sprite(menu_sprites[i], 0, x_pos, y_pos);

    // Highlight if being dragged
    if (selected_item == i && dragging) {
        draw_rectangle(x_pos - 20, y_pos - 20, x_pos + 20, y_pos + 20, false);
    }
}