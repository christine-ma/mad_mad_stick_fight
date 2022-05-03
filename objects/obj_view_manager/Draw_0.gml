
draw_set_halign(fa_center);
if(room = rm_start){
}
if(room == rm_game){
	draw_set_font(fnt_health)
	draw_text(camX+30,camY+25,obj_playerBlue.current_health);
	draw_text(camY+room_width-30,camY+25,obj_playerPink.current_health);
}
if(room = rm_end){
}

