function instance_create(x, y, obj, var_struct = {}){
	return instance_create_layer(x, y, "instances", obj, var_struct)
}