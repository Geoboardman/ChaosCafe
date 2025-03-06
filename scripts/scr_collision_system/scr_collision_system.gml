// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_collision_system(){
	
	vsp +=grav;

	//if place_meeting(x+hsp,y,obj_wall) {
	//	while not place_meeting(x+sign(hsp),y,obj_wall) {
	//		x +=sign(hsp);
	//	}
	//	hsp = 0;
	//}

	//x += hsp;

	if place_meeting(x,y+vsp,obj_wall) {
		while not place_meeting(x,y+sign(vsp),obj_wall) {
			y +=sign(vsp);
		}
		vsp = 0;
	}

	y +=vsp;
 
}
