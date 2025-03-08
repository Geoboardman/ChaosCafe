hsp = 0;
vsp = 0;
grav = 0;

state = "walk_forward";

og_walk_timer = 60;
walk_timer = og_walk_timer;

pet = noone;

sprite_index = choose(spr_girl_idle,spr_boy_idle);

boy_sprites = {
	indle : spr_boy_idle,
	walk_forward : spr_boy_walk_forward,
	walk_sideways : spr_boy_walk_sideways,
}

girl_sprites = {
	indle : spr_girl_idle,
	walk_forward : spr_girl_walk_forward,
	walk_sideways : spr_boy_walk_sideways,
}

currect_sprites = choose( 
	girl_sprites,
	boy_sprites
)