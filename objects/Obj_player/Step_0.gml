
if (global.can_move == true) {
    var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
    var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));
    move_and_collide(_hor * move_speed, _ver * move_speed, tilemap, undefined, undefined, move_speed, move_speed);



//Movement for when player is not holding a weapon 
    
if (_hor != 0 or _ver != 0 and !holding_weapon)
{
    if (_ver > 0) 
        sprite_index = spr_player_walk_down;
    else if (_ver < 0)
        sprite_index = spr_player_walk_up;
    else if (_hor > 0)
        sprite_index = spr_player_walk_right;
    else if (_hor < 0)
        sprite_index = spr_player_walk_left;
         
}
else if  (_hor == 0 or _ver == 0 and !holding_weapon)
{
	if (sprite_index == spr_player_walk_right)
        sprite_index = spr_player_idle_right;
    else if (sprite_index == spr_player_walk_left)
        sprite_index = spr_player_idle_left;
    else if (sprite_index == spr_player_walk_up)
        sprite_index = spr_player_idle_up;
    else if (sprite_index == spr_player_walk_down)
        sprite_index = spr_player_idle_down;
}

//movement for when player is holding a weapon  
if (_hor != 0 or _ver != 0 and holding_weapon) {
    point_direction(x, y, mouse_x, mouse_y);  
    if(image_angle >= 0 and image_angle < 90)
		sprite_index = spr_player_walk_right;
	if(image_angle >= 90 and image_alpha < 180)
		sprite_index = spr_player_walk_up;
	if(image_alpha >= 180 and image_alpha < 270)
		sprite_index = spr_player_walk_left;
	if(image_alpha >= 270 and image_alpha <= 360)
		sprite_index = spr_player_walk_down;
    
}     
    
    
    
    
    
}

//double check to make sure player doesn't move during transition and fixes frames
if (!global.can_move) {
    image_speed = 0;
} else {
    image_speed = 1;
}