//Jampley's script
function scr_mouse_enter(_object = self){
	if collision_point(mouse_x,mouse_y,_object,false,false) != noone {
		return true;
	}
}