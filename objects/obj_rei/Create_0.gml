/// oYurei : Create
event_inherited();

hp = 3;
move_spd = 2.2;
aggro_range = 320;
attack_range = 220;   // ranged attack distance
atk_cd_max = 70;

hover_height = 48;

self.enemy_chase = function enemy_chase()
{
    if (!instance_exists(target)) return;

    facing = sign(target.x - x);

    // move toward player horizontally
    hsp = approach(hsp, facing * move_spd, 0.15);

    // hover near player's Y minus hover_height
    var desiredY = target.y - hover_height;
    vsp = approach(vsp, sign(desiredY - y) * move_spd, 0.15);
}