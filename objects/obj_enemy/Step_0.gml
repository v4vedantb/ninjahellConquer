if (!alive) exit;

// target
if (!instance_exists(target)) target = instance_find(oPlayer, 0);

// choose state
var hasTarget = instance_exists(target);
var dist = hasTarget ? point_distance(x, y, target.x, target.y) : 999999;

if (hasTarget)
{
    if (dist <= attack_range) state = EState.ATTACK;
    else if (dist <= aggro_range) state = EState.CHASE;
    else state = EState.IDLE;
}
else state = EState.IDLE;

// run behavior (sets hsp)
switch (state)
{
    case EState.IDLE:   enemy_idle();   break;
    case EState.CHASE:  enemy_chase();  break;
    case EState.ATTACK: enemy_attack(); break;
}

// gravity
if (use_gravity) vsp += gravity;

// cooldowns
if (atk_cd > 0) atk_cd--;