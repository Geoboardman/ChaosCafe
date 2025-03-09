/// Draw Event (obj_Menu)
draw_set_alpha(0.75);
draw_rectangle(menu_x, menu_y, menu_x + menu_width, menu_y + menu_height, false);
draw_set_alpha(1);

// Draw each menu item
for (var i = 0; i < array_length(menu_items); i++) {
	/// Step Event (obj_Menu)
	var mx = mouse_x;
	var my = mouse_y;
    var x_pos = menu_x + (i * item_spacing) + 40 - item_xoffset; // Position each item
    var y_pos = menu_y + menu_height / 2;

    draw_sprite(menu_sprites[i], 0, x_pos, y_pos);
    draw_text(x_pos+24, y_pos-24, price_list[i] );

    // Highlight if being dragged
    if  (point_distance(mx, my, x_pos, y_pos) < 20) {
		var _color = global.money >= price_list[i]? c_blue: c_red;
        draw_rectangle_color(x_pos-32,y_pos-32 , x_pos + 46, y_pos + 32,_color,_color,_color,_color,true);
    }
}