/// obj_yoyo: Step
if (!instance_exists(owner)) { instance_destroy(); exit; }

// anchor (player hand) - you can replace with player variables if you have a socket/bone system
var ax = owner.x + owner.image_xscale;
var ay = owner.y - 4;

// --- YOYO STATE CONTROL ---
if (state == 0) {
    out_timer++;
    if (out_timer >= out_time) state = 1; // always retract after a short throw
}
else {
    var dx = ax - x;
    var dy = ay - y - 4;
    var dist = max(1, sqrt(dx*dx + dy*dy));

    var rope_max = seg_len * seg_count;

    // damping kills slingshot energy
    var damp = 0.85;
    vx *= damp;
    vy *= damp;

    // only pull if stretched past rope length
    if (dist > rope_max) {
        var stretch = dist - rope_max;
        var pull = 0.50; // small for 20x20
        vx += (dx / dist) * (stretch * pull);
        vy += (dy / dist) * (stretch * pull);
    }

    if (dist < 12) { instance_destroy(); exit; }
}

// --- YOYO PHYSICS ---
vy += gravity / 2;
vx *= air_drag;
vy *= air_drag;

// move + bounce collision (solid objects)
yoyo_move_and_bounce(vx, vy);


// --- ROPE VERLET SIM ---
rope_verlet(ax, ay);
rope_solve_constraints(ax, ay);

// After constraints, we force rope end to match yoyo pos,
// and rope start to match anchor (done in solve function).

var sp = sqrt(vx*vx + vy*vy);
if (sp > max_speed) { vx = vx/sp*max_speed; vy = vy/sp*max_speed; }