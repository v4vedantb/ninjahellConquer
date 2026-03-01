/// oEnemy : Step
if (!alive) exit;

// 1) find/validate target
if (!instance_exists(target)) target = instance_find(oPlayer, 0);

// 2) distance checks
var hasTarget = instance_exists(target);
var dist = hasTarget ? point_distance(x, y, target.x, target.y) : 999999;

// 3) basic aggro → state selection (children can override by changing ranges)
if (hasTarget)
{
    if (dist <= attack_range) state = EState.ATTACK;
    else if (dist <= aggro_range) state = EState.CHASE;
    else state = EState.IDLE;
}
else state = EState.IDLE;

// 4) run state
switch (state)
{
    case EState.IDLE:
        enemy_idle();
    break;

    case EState.CHASE:
        enemy_chase();
    break;

    case EState.ATTACK:
        enemy_attack();
    break;

    case EState.HIT:
        enemy_hit();
    break;

    case EState.DEAD:
        enemy_dead();
    break;
}

// 5) cooldowns + timers
if (atk_cd > 0) atk_cd--;
if (state_timer > 0) state_timer--;