//----------------------PLAYER MOVEMENT----------------------------
tilemap = layer_tilemap_get_id("Tiles_Col");
move_speed = 1;
global.can_move = true;
player_data = src_player_stats();
holding_weapon = player_data.has_weapon;

