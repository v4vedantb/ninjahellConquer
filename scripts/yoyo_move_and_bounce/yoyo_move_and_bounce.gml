function yoyo_move_and_bounce(_dx, _dy) {
    var dir  = point_direction(0, 0, _dx, _dy);
    var dist = point_distance(0, 0, _dx, _dy);

    // move
    x += _dx;
    y += _dy;

    if (place_meeting(x, y, obj_ground)) {
        // undo
        x -= _dx;
        y -= _dy;

        // go to contact point + bounce
        if (dist > 0) {
            move_contact_solid(dir, dist);
            move_bounce_solid(false);
        }

        // energy loss
        vx *= hit_friction;
        vy *= hit_friction;

        // clamp
        var sp = sqrt(vx*vx + vy*vy);
        if (sp > max_speed) { vx = vx/sp*max_speed; vy = vy/sp*max_speed; }
    }

    // IMPORTANT: never allow remaining overlap
    yoyo_resolve_overlap();
}