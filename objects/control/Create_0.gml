randomize()
xsize = 20
ysize = 20
var a, b
for(a = 0; a < xsize; a++)
	for(b  = 0; b < ysize; b++)
		box[a, b] = false
repeat(20){
	a = irandom(xsize - 1)
	b = irandom(ysize - 1)
	if not box[a, b]{
		var objeto = undefined
		objeto = instance_create_layer(a * 32, b * 32, "instances", obj_muro)
		array_set(box[a], b, true)
	}
}
do{
	a = irandom(xsize - 1)
	b = irandom(ysize - 1)
}
until not box[a, b]
instance_create_layer(a * 32 + 16, b * 32 + 16, "instances", obj_jugador)