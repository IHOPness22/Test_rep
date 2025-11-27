//drawing the players function
function draw_my_weapon()
{
    var _weaponYscl = 1;
//if aimDir > 90 && aimDir < 270
//{
//    _weaponYscl = -1;
//}
    draw_sprite_ext(spr_tim_gun, 0, x, centerY,1, _weaponYscl, aimDir,c_white, 1);

}

//player struct 
global.Tim =
{
    has_weapon : false
};

function src_player_stats() {
    return {
        has_weapon : false 
    };
}


global.Slime = 
{
    name : "Slime",
    HP : 10,
    damage : irandom_range(1, 4),
    min_enemies : 3,
    max_enemies : 10
};



