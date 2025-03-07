// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_mouse_enter(_object = self){
	if collision_point(mouse_x,mouse_y,_object,false,false) != noone {
		return true;
	}
}