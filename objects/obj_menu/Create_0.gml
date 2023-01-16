//criando o menu
sel = 0;
marg_val = 32;
marg_total = 32;

pag = 0;

#region METODOS

//desenha o menu
desenha_menu = function(_menu)
{
	draw_set_font(fnt_menu);

	define_align(0, 0);

	//pegando o tamanho do menu
	var quantidade = array_length(_menu);
	var altura = display_get_height();
	var esp_y = string_height("I") + 16;
	var alt_menu = esp_y * quantidade;

	//desenhando as opçoes
	for (var i = 0; i < quantidade; i++){
	
		var cor = c_white, marg_x = 0;
		var _texto = _menu[i][0];
	
		if (sel ==i){
		
			cor = c_fuchsia;
			marg_x = marg_val;
		}
	
		draw_text_color(20 + marg_x, (altura / 2) - alt_menu / 2 + (i * esp_y), _texto, cor, cor, cor, cor, 1);
	}

	draw_set_font(-1);
	define_align(-1, -1);
}

//controlando o menu
controla_menu = function(_menu)
{
	//alterando a seleçao
	var _up, _down, aceitar, recua;
	
	static animar = false

	_up = keyboard_check_pressed(ord("W"));
	_down = keyboard_check_pressed(ord("S"));
	aceitar = keyboard_check_released(vk_enter);
	recua = keyboard_check_pressed(vk_escape);

	if (_up or _down)
	{
		sel += _down - _up;
	
		var tamanho = array_length(_menu) -1;
		sel = clamp(sel, 0, tamanho);
		
		animar = true;
	}
	
	if aceitar 
	{
		switch(_menu[sel][1])
		{
			case 0: _menu[sel][2](); break;
			case 1: pag = _menu[sel][2]; break;
		}
	}
	
	if animar 
	{
		marg_val  = marg_total * valor_ac(ac_margem, _up ^^ _down);
	}
	
}

inicia_jogo = function()
{
	room_goto(Ambiente1);
}

fecha_jogo = function()
{
	game_end();
}

#endregion

menu_principal =	[
						["Iniciar", menu_acoes.roda_metodo, inicia_jogo],
						["Opçõess", menu_acoes.carrega_menu, menus_lista.opcoes],
						["Sair", menu_acoes.roda_metodo, fecha_jogo]
					];

menu_opcoes = [
				["Opção 1",  menu_acoes.roda_metodo, inicia_jogo],
				["Opção 2",  menu_acoes.roda_metodo, inicia_jogo],
				["Opção 3",  menu_acoes.roda_metodo, inicia_jogo],
				["Voltar",  menu_acoes.carrega_menu, menus_lista.principal]
			  ];


menus = [menu_principal, menu_opcoes];