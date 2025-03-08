//draw_text(GUI_WIDTH/3,8,$"GAME STATE: {global.game_state}");


switch (global.game_state) {
	case "menu":
	
		break;
	case "play":
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