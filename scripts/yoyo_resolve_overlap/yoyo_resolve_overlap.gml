function yoyo_resolve_overlap() {
    // If we are inside solid, push out upward first (floor case),
    // then try other directions if needed.
    if (!place_meeting(x, y, obj_ground)) return;

    // try up to 32 pixels up (enough for your 20x20 world)
    for (var i = 0; i < 32; i++) {
        y -= 1;
        if (!place_meeting(x, y, obj_ground)) {
            if (vy > 0) vy = 0; // stop sinking force
            return;
        }
    }

    // fallback: try small spiral if somehow embedded
    var dirs = 8;
    for (var r = 1; r <= 16; r++) {
        for (var a = 0; a < dirs; a++) {
            var ang = a * (360 / dirs);
            var tx = x + lengthdir_x(r, ang);
            var ty = y + lengthdir_y(r, ang);
            if (!place_meeting(tx, ty, obj_ground)) {
                x = tx; y = ty;
                vx = 0; vy = 0;
                return;
            }
        }
    }
}
