function scr_funcoes(){

}

enum menu_acoes
{
	roda_metodo,
	carrega_menu
}

enum menus_lista
{
	principal,
	opcoes
}

///@function define_align(vertical, horizontal)
function define_align(_ver, _hor)
{
	draw_set_halign(_hor);
	draw_set_valign(_ver);
}

//pegar o valor da curva animada
///@function valor_ac(animation_curve, animar, [canal])
function valor_ac(_anim, _animar = false, _chan = 0)
{
	//posiçao na animaçao
	static pos = 0, _val = 0;
	
	//aumentando o valor do pos
	pos += delta_time /1000000;
	
	if _animar
	{
		pos = 0;
	}
	
	var canal = animcurve_get_channel(_anim, _chan);
	_val = animcurve_channel_evaluate(canal, pos);
	
	show_debug_message(_val)
	
	return _val;
}