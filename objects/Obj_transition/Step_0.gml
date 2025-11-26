switch (state) {

    case TRANSITION_STATE.OUT:
        frame += frame_speed;
        alpha += fade_speed_out;   // slow fade to black

        if (frame >= frame_count - 1) {
            frame = frame_count - 1;
            alpha = 1;

            if (room_exists(target_room)) {
                room_goto(target_room);
            }

            alarm[0] = room_speed * 3;
            state = TRANSITION_STATE.WAIT;
        }
    break;


    case TRANSITION_STATE.WAIT:
        // fully black; just waiting
    break;


    case TRANSITION_STATE.IN:
        frame -= frame_speed;
        alpha -= fade_speed_in;   // fade back in
        global.can_move = true;
        global.holding_weapon = true;

        if (frame <= 0) {
            frame = 0;
        }
        if (alpha <= 0) {
            alpha = 0;
            persistent = false;
            instance_destroy();
        }
    break;
}




