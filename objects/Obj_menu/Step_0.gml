
if keyboard_check_pressed(ord("W")) 
{
    menu_selection = (menu_selection - 1 + array_length(menu_options)) mod array_length(menu_options);
    audio_play_sound(Horizontal_menu, 1, false); 
}
if keyboard_check_pressed(ord("S")) 
{
    menu_selection = (menu_selection + 1 ) mod array_length(menu_options);
    audio_play_sound(Horizontal_menu, 1, false);
}
