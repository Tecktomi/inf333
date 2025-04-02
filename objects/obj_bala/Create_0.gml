//Definir vectores unitarios en dirección al mouse + una pequeña desviación
angle = arctan2(mouse_y - y, mouse_x - x) + degtorad(irandom_range(-5, 5))
hmove = cos(angle)
vmove = sin(angle)
obj_jugador.bala_step = 5
//Moverse pixel por pixel hasta colisionar o salir de la pantalla
repeat(500){
	x += hmove
	y += vmove
	if position_meeting(x, y, int_solido) or x < 0 or y < 0 or x > room_width or y > room_height{
		obj_jugador.bala_x = x
		obj_jugador.bala_y = y
		break
	}
}
obj_jugador.bala_x = x
obj_jugador.bala_y = y
instance_destroy()