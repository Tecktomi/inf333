//Definir vectores unitarios en dirección al mouse + una pequeña desviación
if home = obj_jugador
	angle = arctan2(mouse_y - y, mouse_x - x)
else
	angle = arctan2(obj_jugador.y - y, obj_jugador.x - x)
angle += degtorad(irandom_range(-5, 5))
hmove = cos(angle)
vmove = sin(angle)
home.bala_step = 8
//Moverse pixel por pixel hasta colisionar o salir de la pantalla
repeat(500){
	x += hmove
	y += vmove
	if (position_meeting(x, y, int_solido) and not position_meeting(x, y, home)) or x < 0 or y < 0 or x > room_width or y > room_height{
		home.bala_x = x
		home.bala_y = y
		break
	}
}
home.bala_x = x
home.bala_y = y
instance_destroy()