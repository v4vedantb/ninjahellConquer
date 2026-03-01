for (i = 0; i < 6; i++)
{
	if (obj_Player.hp > i)
		draw_sprite_ext(spr_health, 0, i * 50 + 10, 10, 3, 3, 0, c_white ,1);
	else
		draw_sprite_ext(spr_health, 1, i * 50 + 10, 10, 3, 3, 0, c_white ,1);
}