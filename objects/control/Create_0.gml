randomize()
xsize = 30
ysize = 20
var a, b
//Definir la matriz de cajas (para evitar crear dos en el mismo lugar)
for(a = 0; a < xsize; a++)
	for(b  = 0; b < ysize; b++)
		box[a, b] = false
//Crear 40 cajas en lugares aleatorios
repeat(40){
	a = irandom(xsize - 1)
	b = irandom(ysize - 1)
	if not box[a, b]{
		instance_create(a * 32, b * 32, obj_muro)
		array_set(box[a], b, true)
	}
}
//Crear al jugador en un lugar aleatorio sin cajas
do{
	a = irandom(xsize - 1)
	b = irandom(ysize - 1)
}
until not box[a, b]
instance_create(a * 32 + 16, b * 32 + 16, obj_jugador)
//Crear 10 enemigos en lugares aleatorios sin cajas y a más de 200 de distancia del jugador
repeat(10){
	do{
		a = irandom(xsize - 1)
		b = irandom(ysize - 1)
	}
	until not box[a, b] and sqrt(sqr(a * 32 + 16 - obj_jugador.x) + sqr(b * 32 + 16 - obj_jugador.y)) > 300
	instance_create(a * 32 + 16, b * 32 + 16, obj_enemigo)
}