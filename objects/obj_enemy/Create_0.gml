/// oEnemy : Create
// ---- common stats ----
hp           = 3;
move_spd     = 1.5;
gravity      = 0;       // child can override
team         = 1;       // e.g., 1 = enemies

// ---- targeting ----
target       = obj_Player; // or set to noone and assign later
aggro_range  = 200;
attack_range = 32;
facing       = 1;       // 1 right, -1 left

// ---- state machine ----
enum EState { IDLE, CHASE, ATTACK, HIT, DEAD }
state = EState.IDLE;

state_timer = 0;

// ---- motion ----
hsp = 0;
vsp = 0;

// ---- combat ----
atk_cd_max = 40;
atk_cd     = irandom(atk_cd_max);

// ---- helpers ----
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