draw_self();

color =  make_color_rgb(225,182,48)
draw_set_color(c_white)
draw_set_font(fnt_general)
if(room == rm_start){
	draw_text(x,y,"MATCH START")
}
if(room == rm_end){
	draw_set_color(color)
	draw_text(x,y,"PLAY AGAIN")
}


