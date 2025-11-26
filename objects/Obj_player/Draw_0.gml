//draw the weapon behind the player
if aimDir >= 0 && aimDir < 220 && global.holding_weapon == true
{
    draw_my_weapon();
}

//draw the player
draw_self();

//draw the weapon
if aimDir >= 220 && aimDir < 360 && global.holding_weapon == true
{
    draw_my_weapon();
}
