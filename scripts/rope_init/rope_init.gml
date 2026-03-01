function rope_init(ax, ay) {
    // place rope points from anchor to yoyo
    for (var i = 0; i <= seg_count; i++) {
        var t = i / seg_count;
        rope_x[i]  = lerp(ax, x, t);
        rope_y[i]  = lerp(ay, y, t);
        rope_px[i] = rope_x[i];
        rope_py[i] = rope_y[i];
    }
}