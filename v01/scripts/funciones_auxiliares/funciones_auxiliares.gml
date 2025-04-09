
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
	        if (caracter == "1") { instance_create_layer( (xx-1)*32 , (yy-0)*32 ,  control.dp2, obj_muro); }
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
	                instance_create_layer( (xx - 1)*32 +16, yy*32 + 16,  control.dp2, obj_enemigo);
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
	
	draw_text(100, 500, "Abate a todos los enemigos para ganar estas contra el tiempo y no dejes que te detecten");
	draw_text(100, 540, "MANTEN EL SIGILO");
	draw_text(100, 580, "Pasar por el campo de vision de los enemigos te ara perder puntos de sigilo gradualmente");
	draw_text(100, 620, "AL MAXIMO SERAS ELIMINADO!!!")
}


//  RANGO DE VISTA DEL JUGADOR
function mk_shadow(xx, yy, mx, my)
{
	/*
    var cx = mx + (32/2);
    var cy = my + (32/2);
	
	var ox = xx + (cx-xx)*( room_width/sqrt( (cx-xx)*(cx-xx) + (cy-yy)*(cy-yy) ) );
    var oy = yy + (cy-yy)*( room_width/sqrt( (cx-xx)*(cx-xx) + (cy-yy)*(cy-yy) ) );
	
	var angulo = arctan( (32/2)/point_distance(xx,yy,cx,cy) )
	var agudesa = 1.05
	
	var angle1 = angulo*agudesa*(1);
	var xp1 = cx + (ox-cx)*cos(angle1) - (oy-cy)*sin(angle1)
	var yp1 = cy + (ox-cx)*sin(angle1) + (oy-cy)*cos(angle1)
	
	var angle2 = angulo*agudesa*(-1);
	var xp2 = cx + (ox-cx)*cos(angle2) - (oy-cy)*sin(angle2)
	var yp2 = cy + (ox-cx)*sin(angle2) + (oy-cy)*cos(angle2)
	*/

	var vert = [
	    [ point_distance(xx, yy, mx   , my   ), [mx   , my   ]],
	    [ point_distance(xx, yy, mx+32, my   ), [mx+32, my   ]],
	    [ point_distance(xx, yy, mx   , my+32), [mx   , my+32]],
	    [ point_distance(xx, yy, mx+32, my+32), [mx+32, my+32]]
	];
	
	for (var i = 0; i < array_length(vert) - 1; i++)
	{
	    for (var j = i + 1; j < array_length(vert); j++)
		{
	        if (vert[i][0] > vert[j][0])
			{
	            var temp = vert[i];
	            vert[i] = vert[j];
	            vert[j] = temp;
	        }
	    }
	}
	
	var xp1 = xx + ( vert[1][1][0]-xx )*( (room_width*sqrt(2)) / sqrt( (vert[1][1][0]-xx)*(vert[1][1][0]-xx) + (vert[1][1][1]-yy)*(vert[1][1][1]-yy) ) )
	var yp1 = yy + ( vert[1][1][1]-yy )*( (room_width*sqrt(2)) / sqrt( (vert[1][1][0]-xx)*(vert[1][1][0]-xx) + (vert[1][1][1]-yy)*(vert[1][1][1]-yy) ) )
	var xp2 = xx + ( vert[2][1][0]-xx )*( (room_width*sqrt(2)) / sqrt( (vert[2][1][0]-xx)*(vert[2][1][0]-xx) + (vert[2][1][1]-yy)*(vert[2][1][1]-yy) ) )
	var yp2 = yy + ( vert[2][1][1]-yy )*( (room_width*sqrt(2)) / sqrt( (vert[2][1][0]-xx)*(vert[2][1][0]-xx) + (vert[2][1][1]-yy)*(vert[2][1][1]-yy) ) )
	
	var vert_temp1_x = (point_distance(vert[1][1][0], vert[1][1][1], xp1, yp1) < point_distance(vert[1][1][0], vert[1][1][1], xp2, yp2)) ? xp1 : xp2;
	var vert_temp1_y = (point_distance(vert[1][1][0], vert[1][1][1], xp1, yp1) < point_distance(vert[1][1][0], vert[1][1][1], xp2, yp2)) ? yp1 : yp2;
	var vert_temp2_x = (point_distance(vert[1][1][0], vert[1][1][1], xp1, yp1) < point_distance(vert[1][1][0], vert[1][1][1], xp2, yp2)) ? xp2 : xp1;
	var vert_temp2_y = (point_distance(vert[1][1][0], vert[1][1][1], xp1, yp1) < point_distance(vert[1][1][0], vert[1][1][1], xp2, yp2)) ? yp2 : yp1;

	draw_set_color(c_black);
    draw_primitive_begin(pr_trianglefan);
    draw_vertex( vert[1][1][0],vert[1][1][1] );
	draw_vertex(vert_temp1_x, vert_temp1_y);
	draw_vertex(vert_temp2_x, vert_temp2_y);
    draw_vertex( vert[2][1][0],vert[2][1][1] );
    draw_primitive_end();
}


//  AREA TRIANGULO
function triangle_area(x1, y1, x2, y2, x3, y3) {
	    return abs((x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2)) / 2);
	}

