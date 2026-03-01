/// oEnemy : Create
hp = 3;

hsp = 0;
vsp = 0;

move_spd = 1.5;
use_gravity = false;   // children decide
gravity = 0.4;

target = oPlayer;

enum EState { IDLE, CHASE, ATTACK, HIT, DEAD }
state = EState.IDLE;

aggro_range  = 200;
attack_range = 32;

atk_cd_max = 40;
atk_cd = irandom(atk_cd_max);

facing = 1;
alive = true;

self.enemy_idle = enemy_idle;
self.enemy_chase = enemy_chase;
self.enemy_attack = enemy_attack;
self.enemy_hit = enemy_hit;
self.enemy_dead = enemy_dead;

self.take_damage = function take_damage(_dmg, _knock_x, _knock_y)
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