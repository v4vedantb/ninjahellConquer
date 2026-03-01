/// obj_yoyo: Step
if (!instance_exists(owner)) { instance_destroy(); exit; }

// anchor (player hand) - you can replace with player variables if you have a socket/bone system
var ax = owner.x + owner.image_xscale;
var ay = owner.y;

// --- YOYO STATE CONTROL ---
if (state == 0) {
    out_timer++;
    if (out_timer >= out_time) state = 1; // always retract after a short throw
}
else {
    // RETRACT: spring pull toward anchor
    var dx = ax - x;
    var dy = ay - y;
    var dist = max(1, point_distance(x, y, ax, ay));

    var pull = 0.9;
    vx += (dx / dist) * pull;
    vy += (dy / dist) * pull;

    // end when close
    if (dist < 12) { instance_destroy(); exit; }
}

// --- YOYO PHYSICS ---
vy += gravity / 2;
vx *= air_drag;
vy *= air_drag;

// move + bounce collision (solid objects)
var steps = ceil(max(abs(vx), abs(vy)) / 4); // smaller = safer
for (var s = 0; s < steps; s++) {
    yoyo_move_and_bounce(vx/steps, vy/steps);
}

// --- ROPE VERLET SIM ---
rope_verlet(ax, ay);
rope_solve_constraints(ax, ay);

// After constraints, we force rope end to match yoyo pos,
// and rope start to match anchor (done in solve function).