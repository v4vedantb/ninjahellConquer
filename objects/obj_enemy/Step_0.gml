/// oEnemy : Step
if (!alive) exit;

// --- target / state selection ---
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

// --- run behavior (sets hsp/vsp intentions) ---
switch (state)
{
    case EState.IDLE:   enemy_idle();   break;
    case EState.CHASE:  enemy_chase();  break;
    case EState.ATTACK: enemy_attack(); break;
    case EState.HIT:    enemy_hit();    break;
    case EState.DEAD:   enemy_dead();   break;
}

// --- physics / movement (THIS is what you were missing) ---
if (use_gravity) vsp += gravity;

// Apply movement (simple version: no collision here)
x += hsp;
y += vsp;

// cooldowns
if (atk_cd > 0) atk_cd--;