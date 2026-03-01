/// oEnemy Step
if (!alive) {instance_destroy() ;exit;};

// --- target/state ---
if (!instance_exists(target)) target = instance_find(obj_Player, 0);

var hasTarget = instance_exists(target);
var dist = hasTarget ? point_distance(x, y, target.x, target.y) : 999999;
i_frame++;
if (place_meeting(x,y,obj_kunai) && i_frame > 10)
{
	hp -= 1;
	i_frame = 0;
}

if (hp < 1)
{
	alive = false;
	if (hp <= 0)
	{
	    instance_destroy();
	}
}

if (hasTarget)
{
    if (dist <= attack_range) state = EState.ATTACK;
    else if (dist <= aggro_range) state = EState.CHASE;
    else state = EState.IDLE;
}
else state = EState.IDLE;

// --- behavior (sets hsp/vsp intentions) ---
switch (state)
{
    case EState.IDLE:   enemy_idle();   break;
    case EState.CHASE:  enemy_chase();  break;
    case EState.ATTACK: enemy_attack(); break;
}

// --- ground physics by default ---
if (use_gravity) vsp += grav;


// 2) Ground “snap” (keeps them from hovering over tiny gaps/edges)
if (!place_meeting(x, y + ground_check_y, obj_ground))
{
    // try to snap down a few pixels to find the floor
    var i = 0;
    while (i < snap_down_max && !place_meeting(x, y + 1, obj_ground))
    {
        y += 1;
        i++;
    }

    // if we found ground, cancel falling speed so it "sticks"
    if (place_meeting(x, y + 1, obj_ground)) vsp = 0;
}
else
{
    // already grounded: don’t accumulate downward vsp forever
    if (vsp > 0) vsp = 0;
}


// 1) Move with collision (prevents falling through)
move_and_collide(hsp, vsp, obj_ground);