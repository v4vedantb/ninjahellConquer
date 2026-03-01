/// @func move_and_collide(_hsp, _vsp, _solid)
/// @desc Move with pixel-step collision to prevent tunneling through floors
function move_and_collide(_hsp, _vsp, _solid)
{
    // Horizontal
    var sx = sign(_hsp);
    repeat (abs(_hsp))
    {
        if (!place_meeting(x + sx, y, _solid)) x += sx;
        else { hsp = 0; break; }
    }

    // Vertical
    var sy = sign(_vsp);
    repeat (abs(_vsp))
    {
        if (!place_meeting(x, y + sy, _solid)) y += sy;
        else { vsp = 0; break; }
    }
}