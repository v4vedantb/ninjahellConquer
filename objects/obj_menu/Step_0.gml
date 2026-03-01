var up, down, accept, back;

up	   = keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0, gp_padu);
down   = keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(0, gp_padd);
accept = keyboard_check_pressed(ord("F")) || gamepad_button_check_pressed(0, gp_face1);
back   = keyboard_check_pressed(ord("D")) || gamepad_button_check_pressed(0, gp_face2);

if (up) {
	image_index-=1;
}

if (down) {
	image_index++;
}
if image_index == 0 and accept {
	room_goto(rm_Overworld)
}
if image_index == 1 and accept {
	room_goto(rm_Settings)
}

if image_index == 2 and accept {
	room_goto(rm_Help)
}

if image_index == 3 and accept {
	game_end();
} 