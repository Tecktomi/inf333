//Movimiento más lento con shift (modo sigilio)
vel = 2 - keyboard_check(vk_lshift)
hmove = vel * (keyboard_check(ord("D")) - keyboard_check(ord("A")))
vmove = vel * (keyboard_check(ord("S")) - keyboard_check(ord("W")))
//Reducir la velocidad al moverse en diagonal
if abs(hmove * vmove) > vel{
	hmove /= sqrt(2)
	vmove /= sqrt(2)
}
//Colición horizontal
if place_meeting(x + hmove, y, int_solido){
	while not place_meeting(x + sign(hmove), y, int_solido)
		x += sign(hmove)
	hmove = 0
}
x += hmove
//Colición vertical
if place_meeting(x, y + vmove, int_solido){
	while not place_meeting(x, y + sign(vmove), int_solido)
		y += sign(vmove)
	vmove = 0
}

//  COLICION PAREDES/INTERFAZ
if (x < 16) x = 16;
if (x > room_width-16) x = room_width-16;
if (y < 16) y = 16;
if (y > 32*control.N_interfaz - 16) y = 32*control.N_interfaz - 16;

y += vmove
//Disparar con Espacio
if mouse_check_button(mb_left){
	step++
	if step = 8{
		step = 0
		disparar(id)
	}
}
//Dibujar la trayectoria de la bala
if bala_step > 0{
	draw_set_color(c_yellow)
	draw_set_alpha(bala_step-- / 8)
	draw_line(x, y, bala_x, bala_y)
	repeat(6)
		draw_line(bala_x, bala_y, bala_x + irandom_range(-10, 10), bala_y + irandom_range(-10, 10))
	draw_set_alpha(1)
}
draw_set_color(c_black)

//Recorrer todas las cajas para dibujar sus sombras
for(var a = 0; a < instance_number(obj_muro); a++)
{
	var muro = instance_find(obj_muro, a), mx = muro.x, my = muro.y
	mk_shadow(x,y, mx,my)
}

draw_self()