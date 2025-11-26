rightkey = keyboard_check(ord("D"));
leftkey  = keyboard_check(ord("A"));
upkey    = keyboard_check(ord("W"));
downkey  = keyboard_check(ord("S"));
shootkey = mouse_check_button(mb_left);
Ekey  = keyboard_check_pressed(ord(("E")));

//when you shoot 
    //enter the code here 


if (global.can_move) {
    var _hor = rightkey - leftkey;
    var _ver = downkey - upkey;

    // movement
    move_and_collide(_hor * move_speed, _ver * move_speed, tilemap, undefined, undefined, move_speed, move_speed);

    
    if (!holding_weapon) {
        // walking
        if (_hor != 0 || _ver != 0) {
            if (_ver > 0)
                sprite_index = spr_player_walk_down;
            else if (_ver < 0)
                sprite_index = spr_player_walk_up;
            else if (_hor > 0)
                sprite_index = spr_player_walk_right;
            else if (_hor < 0)
                sprite_index = spr_player_walk_left;
        }
        // idle
        else { // _hor == 0 and _ver == 0
            if (sprite_index == spr_player_walk_right)
                sprite_index = spr_player_idle_right;
            else if (sprite_index == spr_player_walk_left)
                sprite_index = spr_player_idle_left;
            else if (sprite_index == spr_player_walk_up)
                sprite_index = spr_player_idle_up;
            else if (sprite_index == spr_player_walk_down)
                sprite_index = spr_player_idle_down;
        }
    }
    
    else {
        
        centerY = y + centerYoffset; 

        // aim at cursor
        aimDir = point_direction(x, centerY, mouse_x, mouse_y);

        face = round(aimDir / 90);
        if (face == 4) face = 0;

        
        if (_hor == 0 && _ver == 0) {
            image_index = 0; // idle frame while holding weapon
            
            switch (face) {
                case 0: sprite_index = spr_player_idle_right; break;
                case 1: sprite_index = spr_player_idle_up;    break;
                case 2: sprite_index = spr_player_idle_left;  break;
                case 3: sprite_index = spr_player_idle_down;  break;
            }
            
        }
        else {
            switch (face) {
                case 0: sprite_index = spr_player_walk_right; break;
                case 1: sprite_index = spr_player_walk_up;    break;
                case 2: sprite_index = spr_player_walk_left;  break;
                case 3: sprite_index = spr_player_walk_down;  break;
            }
        }
    }
    
    depth = -bbox_bottom;

    //aim
    aimDir = point_direction(x, centerY, mouse_x, mouse_y);

    
    
    //if shootkey
    
}

// stop anim during transition
if (!global.can_move) {
    image_speed = 0;
} else {
    image_speed = 1;
}

//If you can collect an item
if(global.can_collect and !global.collected){
	if(Ekey)	// when the user preses the E key, it'll collect the item
		global.collected = true;
}