function disparar(home = noone){
	var a = home.x, b = home.y
	if home.object_index = obj_jugador
		angle = arctan2(mouse_y - b, mouse_x - a)
	else
		angle = arctan2(obj_jugador.y - b, obj_jugador.x - a)
	angle += degtorad(irandom_range(-5, 5))
	hmove = cos(angle)
	vmove = sin(angle)
	home.bala_step = 8
	//Moverse pixel por pixel hasta colisionar o salir de la pantalla
	repeat(500){
		a += hmove
		b += vmove
		if (position_meeting(a, b, int_solido) and not position_meeting(a, b, home)) or a < 0 or b < 0 or a > room_width or b > room_height{
			home.bala_x = a
			home.bala_y = b
			return
		}
	}
	home.bala_x = a
	home.bala_y = b
}