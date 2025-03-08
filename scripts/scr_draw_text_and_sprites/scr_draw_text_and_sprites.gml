function scr_draw_text_and_sprites(_x,_y,_text_list,_color_list,_size=1,_s_index=0) {
	var _list_length = array_length(_text_list);
	for (var i = 0; i < _list_length; i+=1) {
		
		var _xoffset = 0
		
		for (var b = 0; b < i; b+=1) {
			if is_string(_text_list[b]) {
				_xoffset += string_width(_text_list[b]);
			} else {
				_xoffset += sprite_get_width(_text_list[b]);
			}
		}
		
		var _separention = i >= 1? _xoffset : 0;
		
		var _color = _color_list[i];
		
		if is_string(_text_list[i]) {
		    draw_text_transformed_color(
				_x + _separention,
				_y,
				_text_list[i],
				_size,
				_size,
				0,
				_color,
				_color,
				_color,
				_color,
				1
			);
		} else {
		    draw_sprite(
				_text_list[i],
				_s_index,
				_x + _separention,
				_y
			);
		}
		
	}
}
