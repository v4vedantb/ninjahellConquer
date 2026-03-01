// Find the nearest player instance
var player = instance_nearest(x, y, obj_Player);

// Only proceed if a player exists
if (player != noone)
{
    // Make sure all arguments are numbers
    var doorX   = x;
    var doorY   = y;
    var playerX = player.x;
    var playerY = player.y;

    // Calculate distance between door and player
    var dist = point_distance(doorX, doorY, playerX, playerY);

    // Animate door based on proximity
    if (dist < open_range)
        image_index += anim_speed; // open
    else
        image_index -= anim_speed; // close
}

// Clamp animation frames
image_index = clamp(image_index, 0, image_number - 1);