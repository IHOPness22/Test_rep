var slime = global.Slime;

var NUM_OF_ENEMIES = irandom_range(slime.min_enemies, slime.max_enemies);

repeat (NUM_OF_ENEMIES)
{
    var spawn_x = irandom_range(0, room_width);
    var spawn_y = irandom_range(0, room_height);
    instance_create_layer(spawn_x, spawn_y, "Instances", Obj_enemy);
}
alarm[0] = (room_speed * min_delay) + irandom(room_speed * random_range); 