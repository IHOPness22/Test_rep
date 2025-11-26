//draw the weapon behind the player
if aimDir >= 0 && aimDir < 220
{
    draw_my_weapon();
}

//draw the player
draw_self();

//draw the weapon
if aimDir >= 220 && aimDir < 360
{
    draw_my_weapon();
}
