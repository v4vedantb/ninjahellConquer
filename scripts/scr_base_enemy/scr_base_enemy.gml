function enemy_idle()
{
    hsp = approach(hsp, 0, 0.2);
}

function enemy_chase()
{
    if (!instance_exists(target)) return;

    facing = sign(target.x - x);
    hsp = approach(hsp, facing * move_spd, 0.2);
}

function enemy_attack()
{
    // default does nothing; children implement real attacks
    hsp = approach(hsp, 0, 0.3);
}

function enemy_hit()
{
    // brief stun/knockback handled by child or generic
    hsp = approach(hsp, 0, 0.4);
    if (state_timer <= 0) state = EState.IDLE;
}

function enemy_dead()
{
    // default: destroy
    instance_destroy();
}