tick++;
if (tick > 6 * 60){
	global.obj_Player.hp = 6;
	audio_stop_all()
	room_goto(rm_Menu);
}