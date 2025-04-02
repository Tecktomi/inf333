hmove = (obj_jugador.x - x) / sqrt(sqr(obj_jugador.x - x) + sqr(obj_jugador.y - y))
vmove = (obj_jugador.y - y) / sqrt(sqr(obj_jugador.x - x) + sqr(obj_jugador.y - y))
//Moverse pixel por pixel hasta colisionar o salir de la pantalla
repeat(200){
	x += hmove
	y += vmove
	if position_meeting(x, y, obj_jugador){
		home.alerta = true
		instance_destroy()
	}
	if x < 0 or y < 0 or x > room_width or y > room_height
		instance_destroy()
}
instance_destroy()