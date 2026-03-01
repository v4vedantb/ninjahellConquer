function rope_solve_constraints(_ax, _ay) {

    for (var it = 0; it < constraint_iters; it++) {

        // lock endpoints every pass (important)
        rope_x[0] = _ax;
        rope_y[0] = _ay;

        rope_x[seg_count] = x;
        rope_y[seg_count] = y;

        // enforce segment length
        for (var i = 0; i < seg_count; i++) {
            var x1 = rope_x[i];
            var y1 = rope_y[i];
            var x2 = rope_x[i + 1];
            var y2 = rope_y[i + 1];

            var dx = x2 - x1;
            var dy = y2 - y1;
            var d  = max(0.0001, sqrt(dx*dx + dy*dy));

            var diff = (d - seg_len) / d;

            // endpoints: distribute correction
            // if i==0, point 0 is anchored: only move point 1
            // if i+1==seg_count, point end is yoyo: only move point seg_count-1
            if (i == 0) {
                rope_x[i + 1] -= dx * diff;
                rope_y[i + 1] -= dy * diff;
            }
            else if (i + 1 == seg_count) {
                rope_x[i] += dx * diff;
                rope_y[i] += dy * diff;
            }
            else {
                rope_x[i]     += dx * diff * 0.5;
                rope_y[i]     += dy * diff * 0.5;
                rope_x[i + 1] -= dx * diff * 0.5;
                rope_y[i + 1] -= dy * diff * 0.5;
            }
        }

        // OPTIONAL: rope collision with world (makes string wrap-ish)
        // Keep it cheap: only collide a few points (or all if your room is small)
        for (var j = 1; j < seg_count; j++) {
            if (place_meeting(rope_x[j], rope_y[j], obj_Ground)) {
                // simple push out upwards (cheap). Better: push along smallest overlap axis.
                rope_y[j] -= 1;
            }
        }
    }
}