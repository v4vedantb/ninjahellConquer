xsp=0
if (keyboard_check(vk_right))
{
    xsp+=3
    sprite_index = sWarriorRun;
    image_xscale = 1;
}
else if (keyboard_check(vk_left))
{
    xsp -= 3;
    sprite_index = sWarriorRun;
    image_xscale = -1;
}
else
{
    sprite_index = sWarriorIdle;
}


vsp += grav;


if (place_meeting(x, y + 1, objSolid)) { // if heidi is on the ground

    if (keyboard_check_pressed(vk_up)) { // and the up arrow key is pressed

        vsp = -10; // make heidi jump by setting her y_speed to a negative value

    } else { // otherwise, if heidi is on the ground but not jumping

        vsp = 0; // set her y_speed to 0 so she doesn't fall through the ground

    }

}

move_and_collide(xsp, vsp, objSolid)