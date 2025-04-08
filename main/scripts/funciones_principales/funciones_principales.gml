
//  CREAR EL INICIO
function crear_inicio()
{
	//  BACKGROUD
	draw_set_color( control.c_fondo )
	draw_rectangle( 0,0,room_width,room_height, false )
	
	//  ELEMENTOS VENTANA DE INICIO
	if mk_boton( room_width*0.5 , room_height*0.1 , 100, 40, 4, control.c_borde, control.c_relleno, "Jugar" , Font1)
		return Gsetup
		
	if mk_boton( room_width*0.4 , room_height*0.9 , 100, 40, 4, control.c_borde, control.c_relleno, "Salir" , Font1)
		game_end();
		
	if mk_boton( room_width*0.6 , room_height*0.9 , 100, 40, 4, control.c_borde, control.c_relleno, "Ajust" , Font1)
		return ajuste

	return inicio
}

//  CREAR EL GAME-SETUP
function crear_Gsetup()
{	
	var filas = string_split(control.mapa, "-");
	
	gen_map(filas)
	gen_enemy(filas) 
	instance_create_layer( 0+16,0+16, "Instances", obj_jugador);
}

//  CREAR EL JUEGO
function crear_juegos()
{
	draw_set_color( make_color_rgb( 200,222,200 ) );
    draw_rectangle(0, 32*control.N_interfaz ,room_width, room_height, false);
	
	var dd = 4
	draw_set_color( make_color_rgb( 027,027,127 ) );
    draw_rectangle(dd, 32*control.N_interfaz +dd ,room_width-dd, room_height-dd, false);
	
	draw_set_color( make_color_rgb( 000,000,000 ) );
	draw_text(100, 32*control.N_interfaz + 32, "Sigilo :" + string_repeat("x ", control.sigilo));
	draw_text(100, 32*control.N_interfaz + 64, "Tranquilidad :" + string_repeat("x ", control.tranquilidad));
				   
	return false
}

//  CREAR EL CIERRE
function crear_cierre()
{
	return false
}

//  CREAR EL AJUSTE
function crear_ajuste()
{
	//  BACKGROUD
	draw_set_color( make_color_rgb( 100,000,032 ) )
	draw_rectangle( 0,0,room_width,room_height, false )
	
	//  ELEMENTOS VENTANA DE INICIO
	print_msg()
	
	if mk_boton( room_width*0.5 , room_height*0.9 , 100, 40, 4, control.c_borde, control.c_relleno, "Volver" , Font1)
		return inicio

	return ajuste
}


