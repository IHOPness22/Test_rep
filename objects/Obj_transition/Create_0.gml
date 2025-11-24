persistent = true;

enum TRANSITION_STATE {
    OUT,
    WAIT,
    IN
}

state = TRANSITION_STATE.OUT;

// your sprite
spr = spr_transition;
frame_count = sprite_get_number(spr);

// animation frame
frame = 0;

// how fast your sprite animates (adjust this!)
frame_speed = 0.2;

// black fade alpha
alpha = 0;
fade_speed_out = 0.02; 
fade_speed_in  = 0.02;

target_room = noone;

audio_play_sound(Enter_battle, 1, false);