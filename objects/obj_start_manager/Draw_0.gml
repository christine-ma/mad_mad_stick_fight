draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_title);
shakeX = irandom_range(-4,4);
shakeY = irandom_range(-4,4);
draw_text(room_width/2+shakeX,200+shakeY,"MAD MAD");
draw_text(room_width/2+shakeX,400+shakeY,"STICK FIGHT!!!!!");
draw_set_font(fnt_health)
draw_text(room_width/2-450,600,"Blue player:\nLeft:A\nRight:D\nJump:W\nAttack:S");
draw_text(room_width/2+450,600,"Pink player:\nLeft:left key\nRight:right key\nJump:up key\nAttack:down key")


