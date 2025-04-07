if not alerta{
	var dis = distance_to_object(obj_jugador)
	if dis < 250{
		draw_set_alpha(min(0.5, (250 - dis) / 100))
		draw_set_color(c_red)
		draw_triangle(x, y, x + 200 * cos(degtorad(dir + 45)), y + 200 * sin(degtorad(dir + 45)), x + 200 * cos(degtorad(dir - 45)), y + 200 * sin(degtorad(dir - 45)), false)
		draw_set_color(c_black)
		var jug_angle = point_direction(x, y, obj_jugador.x, obj_jugador.y)
		draw_set_alpha(1)
		if dis < 200 and abs(angle_difference(dir, jug_angle)) < 45{
			show_debug_message(1)
			if ver(id){
				show_debug_message(2)
				alerta = true
			}
		}
	}
}
draw_self()
if alerta{
	var jug_angle = point_direction(x, y, obj_jugador.x, obj_jugador.y)
	step++
	if step = 8{
		step = 0
		if ver(id)
			disparar(id)
	}
	//Dibujar la trayectoria de la bala
	if bala_step > 0{
		draw_set_color(c_yellow)
		draw_set_alpha(bala_step-- / 8)
		draw_line(x, y, bala_x, bala_y)
		repeat(6)
			draw_line(bala_x, bala_y, bala_x + irandom_range(-10, 10), bala_y + irandom_range(-10, 10))
		draw_set_alpha(1)
		draw_set_color(c_black)
	}
	draw_text(x, y - 20, "!")
}