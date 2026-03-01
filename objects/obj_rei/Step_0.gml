// Run only the AI part of the parent, not the ground movement.
// Easiest: copy the parent’s state/behavior block OR split parent into scripts.
// Quick solution: duplicate the logic you need here, then move normally.

if (!alive) exit;

if (!instance_exists(target)) target = instance_find(oPlayer, 0);

var hasTarget = instance_exists(target);
var dist = hasTarget ? point_distance(x, y, target.x, target.y) : 999999;

if (hasTarget)
{
    if (dist <= attack_range) state = EState.ATTACK;
    else if (dist <= aggro_range) state = EState.CHASE;
    else state = EState.IDLE;
}
else state = EState.IDLE;

switch (state)
{
    case EState.IDLE:   enemy_idle();   break;
    case EState.CHASE:  enemy_chase();  break;
    case EState.ATTACK: enemy_attack(); break;
}

// flying movement (no ground collision)
x += hsp;
y += vsp;