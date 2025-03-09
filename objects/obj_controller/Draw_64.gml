if DEBUG_MODE == true {
	draw_text(GUI_WIDTH/3,8,global.new_person_timer);
}

switch (global.game_state) {
	case "menu":
	
		break;
	case "play":
		if global.tutorial_text != undefined {
			draw_text(128,8,global.tutorial_text);
		}
		
		scr_draw_text_and_sprites(
			32, //x position
			8, //y position
			[ //array of strings and sprites
				spr_coin,
				$": {global.money}",
			],
			[
				c_white,
				c_white,
			],
			1,
			0
		)
		break;
}