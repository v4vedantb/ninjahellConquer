function rope_verlet(_ax, _ay) {

    // rope start follows anchor (hard lock)
    rope_x[0] = _ax;
    rope_y[0] = _ay;

    // integrate middle points
    for (var i = 1; i < seg_count; i++) {
        var cx = rope_x[i];
        var cy = rope_y[i];

        // velocity = current - previous
        var vxr = (rope_x[i] - rope_px[i]) * 0.98;
        var vyr = (rope_y[i] - rope_py[i]) * 0.98;

        rope_px[i] = cx;
        rope_py[i] = cy;

        rope_x[i] += vxr;
        rope_y[i] += vyr + gravity * 0.6; // rope has lighter gravity than yoyo if you want
    }

    // rope end locked to yoyo
    rope_x[seg_count] = x;
    rope_y[seg_count] = y;
}