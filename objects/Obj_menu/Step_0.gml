
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
if (keyboard_check_pressed(ord("E")) and global.menu_state = MENU_STATE.MAIN) {
    audio_play_sound(Open_menu, 1, false);
    input_menu = menu_options[menu_selection];
    if  (menu_options[menu_selection] == "Talk") {
        show_message("There is no one to talk to...");
        global.menu_open = false;
    }
}