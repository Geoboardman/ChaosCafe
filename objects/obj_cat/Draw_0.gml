draw_self();

if happiness < 20 {
	happiness_frame = 0;
} else if happiness >= 20 and happiness < 40 {
	happiness_frame = 1;
} else if happiness >= 40 and happiness < 60 {
	happiness_frame = 2;	
} else if happiness >= 60 and happiness < 100  {
	happiness_frame = 3
} else {
	happiness_frame = 4
}

draw_sprite(spr_expressions,happiness_frame,x,y-24);
if DEBUG_MODE == true {
	//draw_text(x,y+32,state);
}
