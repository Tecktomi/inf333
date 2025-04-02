if not alerta{
	var dis = distance_to_object(obj_jugador)
	if dis < 250{
		draw_set_alpha((250 - dis) / 50)
		draw_circle(x, y, 200, true)
		draw_set_alpha(1)
		if dis < 200
			instance_create(x, y, obj_vision, {home : id})
	}
}
draw_self()
if alerta
	draw_text(x, y - 20, "!")