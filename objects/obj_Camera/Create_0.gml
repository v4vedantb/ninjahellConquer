// What we follow
target = obj_Player;

// Camera view size (what the camera "sees" in the room)
cam_w = 640;
cam_h = 360;

// Smoothing amount (0.05 = very smooth, 0.2 = snappier)
follow_lerp = 0.12;

// Create camera and assign to view[0]
cam = camera_create_view(0, 0, cam_w, cam_h, 0, -1, -1, -1, -1, -1);
view_camera[0] = cam;
view_visible[0] = true;

// Optional: set port size (how big it appears on screen)
view_wport[0] = cam_w;
view_hport[0] = cam_h;

// Start camera centered on player (if exists)
var p = instance_find(target, 0);
if (instance_exists(p)) {
    cam_x = p.x - cam_w * 0.5;
    cam_y = p.y - cam_h * 0.5;
} else {
    cam_x = 0;
    cam_y = 0;
}

audio_play_sound(Under_Blooms, 0, true)