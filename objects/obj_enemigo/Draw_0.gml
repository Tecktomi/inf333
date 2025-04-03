if not alerta{
	var dis = distance_to_object(obj_jugador)
	if dis < 250{
		draw_set_alpha((250 - dis) / 50)
		for(var a = 0; a < 30; a++){
			var angle = degtorad(dir + 45 + 9 * a), angle_2 = degtorad(dir + 45 + 9 * (a + 1))
			draw_triangle(x, y, x + 200 * cos(angle), y - 200 * sin(angle), x + 200 * cos(angle_2), y - 200 * sin(angle_2), false)
		}
		var jug_angle = point_direction(x, y, obj_jugador.x, obj_jugador.y)
		draw_set_alpha(1)
		if dis < 200 and abs(angle_difference(dir, jug_angle)) < 45{
			instance_create(x, y, obj_vision, {home : id})
		}
	}
}
draw_self()
if alerta{
	var jug_angle = point_direction(x, y, obj_jugador.x, obj_jugador.y)
	step++
	if step = 8{
		step = 0
		instance_create(x, y, obj_bala, {home : id})
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