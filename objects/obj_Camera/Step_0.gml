var p = instance_find(target, 0);
if (!instance_exists(p)) exit;



// Desired camera position (center on player)
var tx = p.x - cam_w * 0.5;
var ty = p.y - 60 - cam_h * 0.5;

// Clamp to room bounds so you don't show outside the room
tx = clamp(tx, 0, room_width  - cam_w);
ty = clamp(ty, 0, room_height - cam_h);

// Smoothly move toward target
cam_x = lerp(cam_x, tx, follow_lerp);
cam_y = lerp(cam_y, ty, follow_lerp);

// Apply
camera_set_view_pos(view_camera[0], cam_x, cam_y);