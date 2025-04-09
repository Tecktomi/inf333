
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
	draw_clear(c_black);
	var filas = string_split(control.mapa, "-");
	
	gen_map(filas)
	gen_enemy(filas) 
	instance_create_layer( 0+16,0+16, control.dp1, obj_jugador);
}

//  CREAR EL JUEGO
function crear_juegos()
{
	draw_set_color( make_color_rgb( 200,222,200 ) );
    draw_rectangle(0, 32*control.N_interfaz ,room_width, room_height, false);
	
	var dd = 4
	draw_set_color( make_color_rgb( 027,027,127 ) );
    draw_rectangle(dd, 32*control.N_interfaz +dd ,room_width-dd, room_height-dd, false);
	
	draw_set_color( make_color_rgb( 200,222,200 ) );
	draw_text(100, 32*control.N_interfaz + 32, "Sigilo :" + string_repeat("x ", floor(control.sigilo)));
	draw_text(100, 32*control.N_interfaz + 64, "Tranquilidad :" + string_repeat("x ", control.tranquilidad));
	
	var glob_flag = false
	for(var a = 0; a < instance_number(obj_enemigo); a++)
	{
		var enemy = instance_find(obj_enemigo, a), flag = enemy.detecion
		if (flag==true) { glob_flag = true }
	}
	
	if ( glob_flag == true ) { control.sigilo -= 0.01; }
	else                     { control.sigilo += 0.001; }
	
	if ( control.sigilo < 0 ) { control.sigilo = 0; return cierre; }
	if ( control.sigilo > 9 ) { control.sigilo = 9; }
				   
	return juegos
}

//  CREAR EL CIERRE
function crear_cierre()
{
	//  BACKGROUD
	draw_set_color( make_color_rgb( 100,000,032 ) )
	draw_rectangle( 0,0,room_width,room_height, false )
	
	//  ELEMENTOS VENTANA DE INICIO
	if mk_boton( room_width*0.5 , room_height*0.8 , 120, 60, 4, control.c_borde, control.c_relleno, "PERDISTE" , Font1)
		return game_end()

	return cierre
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


