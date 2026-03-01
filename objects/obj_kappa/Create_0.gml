/// oKappa : Create
event_inherited();

hp = 5;
move_spd = 1.8;
aggro_range = 240;
attack_range = 28;

atk_cd_max = 50;

self.enemyattack = function enemy_attack()
{
    hsp = approach(hsp, 0, 0.35);

    if (atk_cd <= 0 && instance_exists(target))
    {
        // Spawn a melee hitbox in front
        var hx = x + facing * 18;
        var hy = y;

        var hit = instance_create_layer(hx, hy, "Instances", oEnemyMeleeHit);
        hit.owner = id;
        hit.dmg = 1;
        hit.life = 6;
        hit.facing = facing;

        atk_cd = atk_cd_max;
    }
}