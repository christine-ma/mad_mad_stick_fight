if(game_next_room == true){
	if(room == rm_start){
		//move camera down
		obj_view_manager.camY+=10;
	}
	if(game_next_frames > game_next_frames_max){
		obj_view_manager.camX = 0;
		obj_view_manager.camY = 0;
		room_goto(rm_game);
	}
	game_next_frames++;
}
else{
	if (mouse_check_button_pressed(mb_left)&& position_meeting(mouse_x, mouse_y,self)){
		y = start_y+4;
	}
	if (mouse_check_button_released(mb_left) && position_meeting(mouse_x, mouse_y,self)){
		y = start_y;
		game_next_room = true;
	}
}
