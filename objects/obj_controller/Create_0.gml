room_goto_next();

//GLOBAL VARIABLES
	global.game_state = "menu";
	
	global.camera_x_position = 0;
	global.camera_y_position = 0;
	
	global.volume_mode = false;  // this variable current does nothing

//MACROS
	#macro GUI_WIDTH 448
	#macro GUI_HEIGHT 264
	#macro CAMERA_WIDTH 448
	#macro CAMERA_HEIGHT 264
	#macro MACRO_GRAV 0.3
	
//EMUMS
	enum CatState {
	    IDLE,    
	    SIT,    
	    RUN,     
	    JUMP,    
	    SLEEP,    
	    SLEEP_ON_BED,
	    PICKED_UP,
	}

//OTHERS
	display_set_gui_size(GUI_WIDTH,GUI_HEIGHT);