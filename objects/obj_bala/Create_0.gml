
hmove = (mouse_x - x) / sqrt(sqr(mouse_x - x) + sqr(mouse_y - y))
vmove = (mouse_y - y) / sqrt(sqr(mouse_x - x) + sqr(mouse_y - y))

obj_jugador.bala_step = 5
repeat(500){
	x += 2 * hmove
	y += 2 * vmove
	if place_meeting(x, y, obj_muro) or x < 0 or y < 0 or x > room_width or y > room_height{
		obj_jugador.bala_x = x
		obj_jugador.bala_y = y
		break
	}
}
obj_jugador.bala_x = x
obj_jugador.bala_y = y
instance_destroy()