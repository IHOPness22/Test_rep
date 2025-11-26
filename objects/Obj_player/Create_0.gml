//----------------------PLAYER MOVEMENT----------------------------
tilemap = layer_tilemap_get_id("Tiles_Col");
move_speed = 1;
global.can_move = true;
player_data = src_player_stats();
holding_weapon = player_data.has_weapon;

holding_weapon = true;

moveDir = 0;

centerYoffset = -6;


weaponOffsetdict = 4;
aimDir = 0;

face = 3;
sprite[0] = spr_player_walk_right;
sprite[1] = spr_player_walk_up;
sprite[2] = spr_player_walk_left;
sprite[3] = spr_player_walk_down;

shootTimer = 0;

weapon = global.Weapon_list.Tim_gun;