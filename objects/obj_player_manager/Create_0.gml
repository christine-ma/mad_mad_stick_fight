
global.stage_height = 700;//adjust to the ring height
player_stageY = global.stage_height-85;;
y = player_stageY
//Player Data

//Health Bar
current_health = 10;

//Player States
is_on_ground = true;
combo = false;
is_hit = false;

//Stop all player movement for a small time frame
stop_movement = false;
stop_frames = 0;
stop_max_frames = 15;

left_key = ord("A");
right_key = ord("D");
jump_key = ord("W");
attack_key = ord("S");



//Jump physics
current_x_velocity = 0;
current_y_velocity = 0;
true_x = 0;
true_y = 0;

grav = 0.85;

bounce_velocity = -25;//need this to be a negative value so we move upwards
player_acceleration = 1.5;

//Move when on ground
move_speed=6;

//Spawn Player Blue and Player Pink
//Set opponent
opponent = obj_playerPink;

//Generate shadows for player
shadow_blue = instance_create_layer(x,y,"players",obj_shadow);
shadow_pink = instance_create_layer(x,y,"players",obj_shadow);
shadow_pink.player = obj_playerPink;
