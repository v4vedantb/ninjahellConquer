/// call this from player attack hitboxes
function take_damage(_dmg, _knock_x, _knock_y)
{
    hp -= _dmg;
    hsp += _knock_x;
    vsp += _knock_y;

    if (hp <= 0)
    {
        alive = false;
        state = EState.DEAD;
    }
    else
    {
        state = EState.HIT;
        state_timer = 10;
    }
}