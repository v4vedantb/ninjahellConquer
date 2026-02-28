if (keyboard_check(vk_right))
{
    x += 3;
    sprite_index = sWarriorRun;
    image_xscale = 1;
}
else if (keyboard_check(vk_left))
{
    x -= 3;
    sprite_index = sWarriorRun;
    image_xscale = -1;
}
else
{
    sprite_index = sWarriorIdle;
}


vsp += grav;



if (keyboard_check_pressed(vk_space))
{
    if (place_meeting(x, y + 1, oStarterFloor))
    {
        vsp = jump_spd;
    }
}


if (place_meeting(x, y + vsp, objSolid))
{
    while (!place_meeting(x, y + sign(vsp), objSolid))
    {
        y += sign(vsp);
    }
    vsp = 0;
}
else
{
    y += vsp;
}
	
