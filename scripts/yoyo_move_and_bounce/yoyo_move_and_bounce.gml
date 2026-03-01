function yoyo_move_and_bounce(_dx, _dy) {

    // Horizontal
    x += _dx;
    if (place_meeting(x, y, obj_Ground)) {
        // push out
        var s = sign(_dx);
        while (place_meeting(x, y, obj_Ground)) x -= s;

        // bounce
        vx = -vx * bounce;

        // optional: hit enemies on impact
        //with (instance_place(x, y, obj_enemy)) {
            // take damage, etc
        //}
    }

    // Vertical
    y += _dy;
    if (place_meeting(x, y, obj_Ground)) {
        var s2 = sign(_dy);
        while (place_meeting(x, y, obj_Ground)) y -= s2;

        vy = -vy * bounce;

        //with (instance_place(x, y, obj_enemy)) {
            // take damage, etc
        //}
    }
}