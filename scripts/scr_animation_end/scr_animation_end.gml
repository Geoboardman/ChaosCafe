// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_animation_end(_frames_before_the_end = 1) {
	if image_index > image_number-_frames_before_the_end {
		return true;
	}
}