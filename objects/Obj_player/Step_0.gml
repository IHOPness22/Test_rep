rightkey = keyboard_check(ord("D"));
leftkey  = keyboard_check(ord("A"));
upkey    = keyboard_check(ord("W"));
downkey  = keyboard_check(ord("S"));
shootkey = mouse_check_button(mb_left);
Ekey  = keyboard_check_pressed(ord(("E")));
space = keyboard_check_pressed(vk_space);


if (state == MOVEMENT_STATE.MOVE || state == MOVEMENT_STATE.COOLDOWN) {
//get damaged
if global.holding_weapon  {
    get_damaged(Obj_enemy_parent, true);
    
    //Knockback for the bois (fuck)
}


if (global.can_move) {
    var _hor = rightkey - leftkey;
    var _ver = downkey - upkey;

    // movement
    move_and_collide(_hor * move_speed, _ver * move_speed, tilemap, undefined, undefined, move_speed, move_speed);

    
    if (!global.holding_weapon) {
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
        
        
        if (state == MOVEMENT_STATE.MOVE || state == MOVEMENT_STATE.COOLDOWN || state = MOVEMENT_STATE.DASH) {
        centerY = y + centerYoffset;
        } 

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
    if global.holding_weapon == true 
    {
    aimDir = point_direction(x, centerY, mouse_x, mouse_y);
    }
}
}


    
    //dash movement for player (adding a roll animation later)
    if (global.holding_weapon && space && state == MOVEMENT_STATE.MOVE)  {
        state = MOVEMENT_STATE.DASH
        dashTimer = 30;
        dash_face = face;
        dash_angle = face * 90;
        dash_speed = 3;
        dash_dx = lengthdir_x(dash_speed, dash_angle);
        dash_dy = lengthdir_y(dash_speed, dash_angle);
        
    }   
    if (state == MOVEMENT_STATE.DASH) { 
        move_and_collide(dash_dx, dash_dy, tilemap, undefined, undefined, dash_speed, dash_speed);
        dashTimer--;
    }
    if (dashTimer <= 0 && state == MOVEMENT_STATE.DASH) {
        state = MOVEMENT_STATE.COOLDOWN;
        cooldown_timer = 60;
        shootTimer = 2;
    }    
    if (state == MOVEMENT_STATE.COOLDOWN) {
        weapon_hide_timer = 0;
        cooldown_timer--;
    } 
    if (cooldown_timer <= 0 and state == MOVEMENT_STATE.COOLDOWN) {
        state = MOVEMENT_STATE.MOVE;
        dashTimer = 60;
    }


    //i need a fuckin break
    /*    if dash_face = 0 { x += 10; }
        
        move_speed = 2;
        dashTimer--;
        
    }      
    if (dashTimer <= 0 && state == MOVEMENT_STATE.DASH) {
        state = MOVEMENT_STATE.COOLDOWN
        move_speed = 1;
    }
    if (state == MOVEMENT_STATE.COOLDOWN) {
        dashTimer++;
    }
    if (dashTimer >= 60 && state == MOVEMENT_STATE.COOLDOWN) {
        state = MOVEMENT_STATE.MOVE;
        dashTimer = 60;
    }
   */ 
    

    

// stop anim during transition
if (!global.can_move) {
    image_speed = 0;
} else {
    image_speed = 1;
}

//If you can collect an item
if(global.can_collect and !global.collected){
	if(Ekey){	// when the user preses the E key, it'll collect the item
		global.collected = true;
		audio_play_sound(Collect, 1, false);
	}
}

//shoot the weapon
if state != MOVEMENT_STATE.DASH { 
if shootTimer > 0 { shootTimer--}
if shootkey && shootTimer <= 0
{
    //reset the timer
    shootTimer = weapon.cooldown;
    
    //shooting 
    //create the bullet 
    var _xOffset = lengthdir_x(weapon.length + weaponOffsetdict, aimDir);
    var _yOffset = lengthdir_y(weapon.length + weaponOffsetdict, aimDir);
    
    
    //create the correct number of bullets
    if global.holding_weapon == true
    {    
    var _bulletInst = instance_create_depth(x + _xOffset, centerY + _yOffset, depth-100,  weapon.bullet);
        
    //play bullet sound effect ps. might need to put this in a constructor 
    //in case we add more guns in the future
	audio_play_sound(Gunshot, 0, false);
        
        
        //change the bullets direction
    with(_bulletInst)
    {
        dir = other.aimDir;
    }
    }    
}
}


//player can open menu
if (keyboard_check_pressed(ord("R")) and !global.menu_open and global.menu_state == MENU_STATE.MAIN)
{
    global.menu_open = true;
    global.can_move = false;
    instance_create_layer(x, y, "Instances", Obj_menu);
    audio_play_sound(Open_menu, 1, false);
}
else if (global.menu_open) {
    if (keyboard_check_pressed(ord("R"))) {
        global.menu_open = false;
        global.can_move = true;
        audio_play_sound(Open_menu, 1, false);
        with (Obj_menu) {
            instance_destroy();
        }
    }
}




