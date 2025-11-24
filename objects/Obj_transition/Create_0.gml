spr = spr_transition;

frame_count = sprite_get_number(spr);

frame = 0;

frame_speed = 0.5;

// States for fade
enum TRANSITION_STATE {
    OUT,
    IN
}

state = TRANSITION_STATE.OUT;

//audio_play_sound(snd_transition_jingle, 1, false);
