if cursor != window_get_cursor()
	window_set_cursor(cursor)
cursor = cr_arrow



//  SI ES INICIO
if inicio
{
	//  VENTANA DE INICICO
	draw_set_color( c_fondo )
	draw_rectangle( 0,0,room_width,room_height, false )
	
	//  ELEMENTOS VENTANA DE INICIO
	if draw_boton( 100 , 100 , 80 , 40 , 8 , c_boton_gen_r , c_boton_gen_b , "jugar"){
		juego()
		inicio = false
	}
		
	
	//  
}