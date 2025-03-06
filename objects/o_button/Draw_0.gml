draw_self()

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_transformed_color(x,y,text,text_size,text_size,0,text_color,text_color,text_color,text_color,1);

if global.button_selected == row_id and global.column_selected == column_id {
	if global.volume_mode != true {
		pointer_frame += pointer_animation_speed;
	}
	draw_sprite(spr_pointer,pointer_frame,x-sprite_width/2-8,y);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);

