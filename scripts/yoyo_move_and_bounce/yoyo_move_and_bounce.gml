function yoyo_move_and_bounce(_dx, _dy) {
    var dir = point_direction(0, 0, _dx, _dy);
    var dist = point_distance(0, 0, _dx, _dy);

    // Try to move
    x += _dx;
    y += _dy;

    // If we hit solid ground, move back and resolve properly
    if (place_meeting(x, y, obj_Ground)) {
        x -= _dx;
        y -= _dy;

        // Move as close as possible without overlapping
        move_contact_solid(dir, dist);

        // Bounce off the solid surface
        move_bounce_solid(false);

        // Energy loss so it doesn't rocket
        vx *= hit_friction;
        vy *= hit_friction;

        vx *= bounce / max(0.0001, hit_friction);
        vy *= bounce / max(0.0001, hit_friction);

        // Hard clamp
        var sp = sqrt(vx*vx + vy*vy);
        if (sp > max_speed) { vx = vx/sp*max_speed; vy = vy/sp*max_speed; }
    }
}