// --- Movement tuning ---
move_spd = 2.4;
grav = 0.35;
max_fall = 10;

jump_power = 3.5;     // initial jump velocity
jump_hold_force = 0.35; // extra upward boost while holding
jump_hold_max = 12;   // frames you can hold for higher jump

// --- Optional feel helpers (recommended) ---
coyote_max = 7;       // frames after leaving ground you can still jump
buffer_max = 7;       // jump input buffer frames

// --- State ---
hsp = 0;
vsp = 0;

accel = 0.6;   // how fast you speed up
decel = 0.7;   // how fast you slow down

x_rem = 0;            // sub-pixel remainder for x
y_rem = 0;            // sub-pixel remainder for y

jump_hold = 0;        // how many frames we've held jump since takeoff
coyote = 0;
jump_buffer = 0;

facing = 1;

// Stats
hp = 6;


// start sprite
sprite_index = spr_player_idle;