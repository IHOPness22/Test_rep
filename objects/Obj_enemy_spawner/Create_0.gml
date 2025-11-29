// 0x04678 0x07328 0x03267 0x09329
slime = global.Slime;
global.player_radius = 40;

switch (global.enemy_encounter)
{
    case "Slime":
        spawned_enemies = irandom_range(slime.min_enemies, slime.max_enemies);
        for (i=0; i < spawned_enemies; i++) {
            var _spawn_x = irandom_range(0, room_width);
            var _spawn_y = irandom_range(0, room_height);
            while (point_distance(_spawn_x, _spawn_y, Obj_player.x, Obj_player.y) < global.player_radius) { 
                _spawn_x = irandom_range(0, room_width);
                _spawn_y = irandom_range(0, room_height);
            }
            instance_create_layer(_spawn_x, _spawn_y, "Instances", Obj_enemy);
        }
        
}

