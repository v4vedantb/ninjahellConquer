tick++;
if (tick > 6 * 60){
	audio_stop_all()
	room_goto(rm_Menu);
}