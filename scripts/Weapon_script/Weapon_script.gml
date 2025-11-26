// constructor template for weapons 
function create_weapon(_sprite, _length, _bullet, _cooldown) constructor
{
    sprite = _sprite;
    length = _length;
    bullet = _bullet;
    cooldown = _cooldown;
}

global.Weapon_list = {

    Tim_gun : new create_weapon(
        spr_tim_gun, 
        sprite_get_bbox_right(spr_tim_gun) - sprite_get_xoffset(spr_tim_gun), 
        Obj_WhiteBullet,  
        15 
        )
    
}