randomize()
xsize = 20
ysize = 20
var a, b
//Definir la matriz de cajas (para evitar crear dos en el mismo lugar)
for(a = 0; a < xsize; a++)
	for(b  = 0; b < ysize; b++)
		box[a, b] = false
//Crear 20 cajas en lugares aleatorios
repeat(20){
	a = irandom(xsize - 1)
	b = irandom(ysize - 1)
	if not box[a, b]{
		instance_create_layer(a * 32, b * 32, "instances", obj_muro)
		array_set(box[a], b, true)
	}
}
//Crear al jugador en un lugar aleatorio sin cajas
do{
	a = irandom(xsize - 1)
	b = irandom(ysize - 1)
}
until not box[a, b]
instance_create_layer(a * 32 + 16, b * 32 + 16, "instances", obj_jugador)