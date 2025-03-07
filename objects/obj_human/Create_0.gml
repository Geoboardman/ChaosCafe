hsp = 0;
vsp = 0;
grav = MACRO_GRAV;

state = "idle";

og_walk_timer = 60;
walk_timer = og_walk_timer;

sprite_index = choose(spr_girl_idle,spr_boy_idle);

boy_sprites = {
	indle : spr_boy_idle,
	walk : spr_boy_walk_forward,
}

girl_sprites = {
	indle : spr_girl_idle,
	walk : spr_girl_walk_forward,
}

currect_sprites = choose( 
	girl_sprites,
	boy_sprites
)