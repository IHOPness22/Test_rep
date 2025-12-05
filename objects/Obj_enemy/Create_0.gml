HP = 6;
damage = irandom_range(1, 4);
stop_time = irandom_range(3, 5);
stop_timer = stop_time * room_speed;
run_time = irandom_range(3, 5);
run_timer = run_time * room_speed;

direction = 0;
hop_speed = irandom_range(3,4);
jumpTimer = irandom_range(20, 30);


enum ENEMY_STATE {
    STOP,
    MOVE,
    DASH
}

state = ENEMY_STATE.STOP;

      