/// obj_yoyo: Step
if (!instance_exists(owner)) { instance_destroy(); exit; }

// anchor (player hand) - you can replace with player variables if you have a socket/bone system
var ax = owner.x + owner.image_xscale;
var ay = owner.y - 4;

out_timer++;
if (out_time < out_timer) { instance_destroy(); exit; }

vx = throw_speed;

x += vx * dir;