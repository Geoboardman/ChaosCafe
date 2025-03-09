draw_self();

if happiness < 25 {
	happiness_frame = 0;
} else if happiness >= 25 and happiness < 50 {
	happiness_frame = 1;
} else if happiness >= 50 and happiness < 100 {
	happiness_frame = 2;	
} else {
	happiness_frame = 3
}

draw_sprite(spr_expressions,happiness_frame,x,y-24);
if DEBUG_MODE == true {
	//draw_text(x,y+32,state);
}
