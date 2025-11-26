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


var Tim =
{
    has_weapon : false
};

function src_player_stats() {
    return {
        has_weapon : false 
    };
}