/// obj_yoyo: Create
owner = noone          // set by player when spawning
state = 0;              // 0=OUT, 1=RETRACT

// yoyo motion
vx = 0;
vy = 0;
radius = 4;            // collision radius
bounce = 0.35;          // bounciness off surfaces
air_drag = 0.985;
hit_friction = 0.75;    // extra energy loss on impact

// rope settings
seg_len = 4;        // each rope segment ~4px
seg_count = 12;     // total rope length ~48px (good starting range)
constraint_iters = 8;
gravity = 0.25;      // lower = less crazy
max_speed = 6;          // tuned for 20x20 style

// verlet arrays
rope_x  = array_create(seg_count + 1, x);
rope_y  = array_create(seg_count + 1, y);
rope_px = array_create(seg_count + 1, x);
rope_py = array_create(seg_count + 1, y);

out_time = 12;      // frames it flies out before retract
out_timer = 0;
state = 0;          // 0=OUT, 1=RETRACT

self.rope_init = rope_init
self.rope_solve_constraints = rope_solve_constraints

// initialize rope points in a straight line from player hand to yoyo
// (owner must be set right after create, so we can also re-init in a script after spawn)