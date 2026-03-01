// Resolve horizontal
if (place_meeting(x, y, obj_ground))
{
    // back out and snap
    x -= hsp;
    while (!place_meeting(x + sign(hsp), y, obj_ground)) x += sign(hsp);
    hsp = 0;
}

// Resolve vertical
if (place_meeting(x, y, obj_ground))
{
    y -= vsp;
    while (!place_meeting(x, y + sign(vsp), obj_ground)) y += sign(vsp);
    vsp = 0;
}