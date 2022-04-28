if(combo_activated==true){
	instance_destroy(obj_combo_activator);
}
else if(is_spawned == true){
	if(combo_frames>combo_max_frames){
		//despawn combo activator
		instance_destroy(obj_combo_activator);
		//reset values
		combo_frames = 0;
		//combo_max_frames = irandom_range(50, 100)
		combo_max_frames = irandom_range(300, 450);
		is_spawned = false;
	}
	combo_frames++;
}
else{
	if(spawn_combo_frames > spawn_combo_max_frames){
		//spawn combo activator
		instance_create_layer(irandom_range(50,room_width-50), -10,"objects",obj_combo_activator);
		is_spawned = true;
		//reset values
		spawn_combo_max_frames = irandom_range(50, 100);
		//spawn_combo_max_frames = irandom_range(250, 400);
		spawn_combo_frames = 0;
	}
	spawn_combo_frames++;
}
