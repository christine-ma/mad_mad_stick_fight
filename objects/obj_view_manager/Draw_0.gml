
draw_set_halign(fa_center);
draw_set_valign(fa_center);
if(room = rm_start){
}
if(room == rm_game){
	draw_set_font(fnt_general)
	blue_health = (obj_playerBlue.current_health/global.max_health)*100
	pink_health = (obj_playerPink.current_health/global.max_health)*100
	blue_color  = make_color_rgb(7,192,223)
	pink_color = make_color_rgb(228,0,140)
	back_color =  make_color_rgb(48,37,94)
	
	draw_healthbar(100, 140, 500,190, blue_health, back_color,blue_color,blue_color, 1, true,false);
	draw_healthbar(room_width/2+145, 140, room_width/2+545,190, pink_health, back_color,pink_color,pink_color, 0, true,false);
	draw_set_color(c_white)
	draw_text(room_width/2,165," HEALTH ");
	
}
if(room = rm_end){
}

