function draw_boton( x_pos , y_pos , x_dim , y_dim , margen , c_r , c_b , texto , boton =  mb_left )
{
	draw_set_color( c_b )
	draw_rectangle( x_pos-margen,y_pos-margen,x_pos+x_dim+margen,y_pos+y_dim+margen, false )
	draw_set_color( c_r )
	draw_rectangle( x_pos,y_pos,x_pos+x_dim,y_pos+y_dim, false )
	draw_set_color(c_black)
	x_t = string_width( texto )
	y_t = string_height( texto )
	draw_text( x_pos , y_pos, texto )
	
	if mouse_x > x_pos and mouse_y > y_pos and mouse_x < x_pos + x_dim and mouse_y < y_pos + y_dim{
		cursor = cr_handpoint
		if mouse_check_button_pressed(mb_left)
			return true
	}
	return false
}
