vel = 2 - keyboard_check(vk_lshift)
hmove = vel * (keyboard_check(ord("D")) - keyboard_check(ord("A")))
vmove = vel * (keyboard_check(ord("S")) - keyboard_check(ord("W")))
if abs(hmove * vmove) > vel{
	hmove /= sqrt(2)
	vmove /= sqrt(2)
}
if place_meeting(x + hmove, y, obj_muro){
	while not place_meeting(x + sign(hmove), y, obj_muro)
		x += sign(hmove)
	hmove = 0
}
x += hmove

if place_meeting(x, y + vmove, obj_muro){
	while not place_meeting(x, y + sign(vmove), obj_muro)
		y += sign(vmove)
	vmove = 0
}
y += vmove
if keyboard_check_pressed(vk_space){
	step++
	if step = 4{
		step = 0
		instance_create_layer(x, y, "instances", obj_bala)
	}
}
if bala_step > 0{
	draw_set_color(c_yellow)
	draw_set_alpha(bala_step / 5)
	draw_line(x, y, bala_x, bala_y)
	bala_step--
}
draw_set_alpha(1)
draw_set_color(c_black)
for(var a = 0; a < instance_number(obj_muro); a++){
	var muro = instance_find(obj_muro, a), mx = muro.x, my = muro.y
	//Equinas
	var ne = sqrt(sqr(mx - x) + sqr(my - y)), xne = (mx - x) / ne, yne = (my - y) / ne
	var no = sqrt(sqr(mx + 32 - x) + sqr(my - y)), xno = (mx + 32 - x) / no, yno = (my - y) / no
	var se = sqrt(sqr(mx - x) + sqr(my + 32 - y)), xse = (mx - x) / se, yse = (my + 32 - y) / se
	var so = sqrt(sqr(mx + 32 - x) + sqr(my + 32 - y)), xso = (mx + 32 - x) / so, yso = (my + 32 - y) / so
	//Dibujos
	if x - 32 < mx{
		if y > my{
			draw_triangle(mx, my, mx + 32, my, mx + xne * 1000, my + yne * 1000, false)
			draw_triangle(mx + 32, my + 32, mx + 32, my, mx + 32 + xso * 1000, my + 32 + yso * 1000, false)
			draw_triangle(mx + 32, my, mx + xne * 1000, my + yne * 1000, mx + 32 + xso * 1000, my + 32 + yso * 1000, false)
		}
		if y - 32 < my{
			draw_triangle(mx + 32, my, mx + 32, my + 32, mx + 32 + xno * 1000, my + yno * 1000, false)
			draw_triangle(mx, my + 32, mx + 32, my + 32, mx + xse * 1000, my + 32 + yse * 1000, false)
			draw_triangle(mx + 32, my + 32, mx + 32 + xno * 1000, my + yno * 1000, mx + xse * 1000, my + 32 + yse * 1000, false)
		}
	}
	if x > mx{
		if y > my{
			draw_triangle(mx, my, mx + 32, my, mx + 32 + xno * 1000, my + yno * 1000, false)
			draw_triangle(mx, my, mx, my + 32, mx + xse * 1000, my + 32 + yse * 1000, false)
			draw_triangle(mx, my, mx + 32 + xno * 1000, my + yno * 1000, mx + xse * 1000, my + 32 + yse * 1000, false)
		}
		if y - 32 < my{
			draw_triangle(mx, my, mx, my + 32, mx + xne * 1000, my + yne * 1000, false)
			draw_triangle(mx, my + 32, mx + 32, my + 32, mx + 32 + xso * 1000, my + 32 + yso * 1000, false)
			draw_triangle(mx, my + 32, mx + xne * 1000, my + yne * 1000, mx + 32 + xso * 1000, my + 32 + yso * 1000, false)
		}
	}
}
draw_self()