owner = noone          // set by player when spawning
state = 0;              // 0=OUT, 1=RETRACT

// yoyo motion
vx = 0;
vy = 0;
radius = 4;            // collision radius

// rope settings
damage = 5;
seg_len = 4;        // each rope segment ~4px
seg_count = 12;     // total rope length ~48px (good starting range)
constraint_iters = 8;

throw_speed = 8;

max_speed = 8;          // tuned for 20x20 style
out_time = 76;      // frames it flies out before retract
out_timer = 0;

dir = 1;