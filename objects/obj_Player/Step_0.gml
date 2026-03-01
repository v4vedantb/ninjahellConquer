// INPUT
var inpX = keyboard_check(vk_right) - keyboard_check(vk_left);
var j_pressed = keyboard_check_pressed(ord("X"));
var j_held    = keyboard_check(ord("X"));
var attack_pressed = keyboard_check_pressed(ord("Z"))

// BUFFER jump input
if (j_pressed)
	jump_buffer = buffer_max;
else
	jump_buffer = max(0, jump_buffer - 1);

// GROUND CHECK (1px below)
var on_ground = place_meeting(x, y + 1, obj_ground);

// COYOTE time
if (on_ground)
	coyote = coyote_max;
else
	coyote = max(0, coyote - 1);

// HORIZONTAL (simple direct speed; add accel later if you want)
var target = inpX * move_spd;

if (inpX != 0) {
    // accelerate toward target speed
    hsp = approach(hsp, target, accel);
} else {
    // decelerate toward 0 when no input
    hsp = approach(hsp, 0, decel);
}

// START JUMP (uses coyote + buffer)
var do_jump = (jump_buffer > 0) && (coyote > 0);
if (do_jump) {
    vsp = -jump_power;
    jump_hold = 0;
    jump_buffer = 0;
    coyote = 0;
}

// HOLD JUMP (Hollow Knight style: keep going up a bit while holding)
if (j_held && vsp < 0 && jump_hold < jump_hold_max) {
    vsp -= jump_hold_force;
    jump_hold += 1;
}

// GRAVITY
vsp += grav;
if (vsp > max_fall) vsp = max_fall;

// ==========================
// SUB-PIXEL SAFE MOVE + COLLIDE X
// ==========================
x_rem += hsp;
var move_x = round(x_rem);
x_rem -= move_x;

var sx = sign(move_x);
repeat (abs(move_x)) {
    if (!place_meeting(x + sx, y, obj_ground)) {
        x += sx;
    } else {
        // stop on wall
        x_rem = 0;
        break;
    }
}

// ==========================
// SUB-PIXEL SAFE MOVE + COLLIDE Y (NO SINKING)
// ==========================
y_rem += vsp;
var move_y = round(y_rem);
y_rem -= move_y;

var sy = sign(move_y);
repeat (abs(move_y)) {
    if (!place_meeting(x, y + sy, obj_ground)) {
        y += sy;
    } else {
        // land / hit ceiling
        if (sy > 0) {
            // landed
            jump_hold = 0;
        }
        vsp = 0;
        y_rem = 0; // IMPORTANT: prevents gradual sinking
        break;
    }
}

if (inpX != 0) facing = -inpX;
image_xscale = facing;

// Decide what sprite we are at
var desired = sprite_index;
// Pick animation state
if (!on_ground) {
    // Airborne: jump vs fall
    if (vsp < 0) {
        sprite_index = spr_player_jump;
    } else {
        sprite_index = spr_player_fall;
    }
}
else {
    // Grounded: idle vs run
    if (abs(hsp) > 0.2) {
        sprite_index = spr_player_walk;
    } else {
        sprite_index = spr_player_idle;
    }
}
// If switching sprites, restart animation on frame 1 (frame 0 internally)
if (desired != sprite_index) image_index = 0; // "frame 1" visually

cool_tick++;

i_frame++;

if (place_meeting(x, y, obj_enemy) && i_frame > 45)
{
	hp -= 1;
	i_frame = 0;
	if (hp < 1)
	{
		room_goto(rm_lose)
	}
}

if (attack_pressed && cool < cool_tick) {
    var yy = instance_create_layer(x, y, "Instances", obj_kunai);
    yy.owner = id;
	cool_tick = 0;

    // anchor point (hand)
    var ax = x;
    var ay = y - 15;

    yy.x = ax;
    yy.y = ay;
	yy.dir = -facing;

    // launch direction
    var dir = (image_xscale < 0) ? 0 : 180;
    var spd = 5;

    yy.vx = lengthdir_x(spd, dir);
    //yy.vy = lengthdir_y(spd + 5, dir);

    // initialize rope points from anchor to yoyo
    //yy.rope_init(ax, ay);
}