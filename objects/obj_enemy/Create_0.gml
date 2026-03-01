/// oEnemy Create (ground by default)
hp = 3;

hsp = 0;
vsp = 0;

move_spd = 1.5;
use_gravity = true;
grav = 0.5;
i_frame = 0;

ground_obj = obj_ground;   // <<< base enemy collides with this

// “stick to ground” tuning
snap_down_max = 6;         // how far it can snap down per step
ground_check_y = 1;        // 1px below bbox

target = obj_Player;

enum EState { IDLE, CHASE, ATTACK, HIT, DEAD }
state = EState.IDLE;

aggro_range  = 200;
attack_range = 32;

facing = 1;
alive = true;