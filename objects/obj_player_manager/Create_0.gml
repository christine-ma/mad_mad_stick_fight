

global.winner = noone;
global.stage_height = 700;//adjust to the ring height
player_stageY = global.stage_height-85;
y = player_stageY
//Player Data

//Health Bar
current_health = 25;

//Player States
is_on_ground = true;
combo = false;
is_hit = false;

cooldown = false;

cooldown_frames = 0;
cooldown_max_frames = 30;

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

grav = 1;

bounce_velocity = -25;//need this to be a negative value so we move upwards
player_acceleration = .6;

//Move when on ground
move_speed = 7;
ground_acceleration = true;
acceleration_frames = 0;
acceleration_max_frames = 25;
deceleration_frames = 0;
deceleration_max_frames = 25;

//Spawn Player Blue and Player Pink
//Set opponent
opponent = noone;

//Generate shadows for player
shadow_blue = instance_create_layer(x,y,"players",obj_shadow);
shadow_pink = instance_create_layer(x,y,"players",obj_shadow);
shadow_pink.player = obj_playerPink;



//sprite visual

idle_sprite = noone;
attack_sprite = noone;
jump_sprite = noone;
knockback_sprite = noone;


