
//  BOTON GENERICO
function mk_boton(x_pos, y_pos, x_dim, y_dim, margen, c_b, c_r, texto, fuente)
{
    draw_set_color(c_b);
    draw_rectangle(x_pos - x_dim / 2 - margen, y_pos - y_dim / 2 - margen, 
                   x_pos + x_dim / 2 + margen, y_pos + y_dim / 2 + margen, false);

    draw_set_color(c_r);
    draw_rectangle(x_pos - x_dim / 2, y_pos - y_dim / 2, 
                   x_pos + x_dim / 2, y_pos + y_dim / 2, false);

    draw_set_font(fuente);
    draw_set_color(c_black);
    var tx_dim = string_width(texto);
    var ty_dim = string_height(texto);
    draw_text(x_pos - tx_dim / 2, y_pos - ty_dim / 2, texto);
	
	if (mouse_x >= x_pos - x_dim / 2 && mouse_x <= x_pos + x_dim / 2 &&
        mouse_y >= y_pos - y_dim / 2 && mouse_y <= y_pos + y_dim / 2)
    {
        window_set_cursor(cr_handpoint);
        if (mouse_check_button_pressed(mb_left)) { return true; }
    }

    return false;
}

//  GENERAR MUROS A PARTIR DEL MAPA
function gen_map(filas) 
{
	for (var yy = 0; yy < array_length(filas); yy++)
	{
	    var fila = filas[yy];
	    for (var xx = 1; xx < string_length(fila); xx++)
		{
	        var caracter = string_char_at(fila, xx);
	        if (caracter == "1") { instance_create_layer( (xx-1)*32 , (yy-0)*32 , "Instances", obj_muro); }
	    }
	}
}

//  GENERAR ENEMIGOS A PARTIR DEL MAPA
function gen_enemy(filas) 
{
	var contador = 0;
	for (var yy = 0; yy < array_length(filas); yy++)
	{
	    var fila = filas[yy];
	    for (var xx = 1; xx < string_length(fila); xx++)
		{
	        var caracter = string_char_at(fila, xx);
	        if ( caracter == "0" && xx!=0 && yy!=0 )
			{
				if (irandom(79) == 0 && contador < 10)
				{
	                instance_create_layer( (xx - 1)*32 +16, yy*32 + 16, "Instances", obj_enemigo);
	                contador += 1;
				}
			}
	    }
	}
}

// PA LOS PAJEROS
function instance_create(x, y, obj, var_struct = {}){
	return instance_create_layer(x, y, "instances", obj, var_struct)
}


// MENSAJE MECANICAS
function print_msg()
{
	draw_set_color( make_color_rgb( 000,000,000 ) )
	draw_text(100, 080, "CREADORES:");
	draw_text(100, 120, "    Saxel - Kebab69 - Stalin");
	draw_text(100, 160, "Assets:");
	draw_text(100, 200, "    NaN - NaN - NaN:");
	
	draw_text(100, 300, "Mecanica : BACKSHOT");
	draw_text(100, 340, "Cansado de los tipicos HEADSHOOT... Pues precentamos BACKSHOT!!!");
	draw_text(100, 380, "El nuevo modo en el que tu personaje siente profunda culpa Por avatir a sus enemigos...");
	draw_text(100, 420, "Acavalos por la espalda y no los mires a los ojos, cuanto mas de frente sean tus tiros tu indicador de culpa");
	draw_text(100, 460, "Aumentara hasta que te consuman tus remordimeintos");
	
	draw_text(100, 500, "Abate a todos los enemigos para ganar estas contra el tiempo y no dejes que te detecten, MANTEN EL SIGILO");
	draw_text(100, 540, "MANTEN EL SIGILO");
	draw_text(100, 580, "Pasar por el campo de vision de los enemigos te ara perder puntos de sigilo gradualmente");
	draw_text(100, 620, "AL MAXIMO SERAS ELIMINADO!!!")
}





