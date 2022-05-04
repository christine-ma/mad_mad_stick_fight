draw_set_color(c_white);
blue_color  = make_color_rgb(19,56,162)
pink_color = make_color_rgb(144,0,100)
purple_color =  make_color_rgb(48,37,94)
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_title);
shakeX = irandom_range(-4,4);
shakeY = irandom_range(-4,4);
draw_text(room_width/2+shakeX,200+shakeY,"MAD MAD");
draw_text(room_width/2+shakeX,390+shakeY,"STICK FIGHT!!!!!");
draw_set_font(fnt_general)
draw_set_color(blue_color);
draw_text(room_width/2-450,600,"Blue Player:\nLeft: A\nRight :D\nJump: W\nAttack: S");
draw_set_color(pink_color);
draw_text(room_width/2+450,600,"Pink Player:\nLeft: <\nRight: >\nJump: ^\nAttack: v")


