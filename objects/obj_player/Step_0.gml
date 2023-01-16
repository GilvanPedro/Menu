//ANDAR
//sign transforma os resultados dentro dele em -1, 0 ou 1
move = -keyboard_check(ord("A"))+keyboard_check(ord("D"));

hsp = move * spd

if place_meeting(x+hsp, y, par_estruturas)
{
	
	while !place_meeting(x+sign(hsp), y, par_estruturas)
	{
		x+= sign(hsp);
	}
	hsp = 0;
}

x +=hsp;

if place_meeting(x, y+vsp, par_estruturas)
{
	
	while !place_meeting(x, y+sign(vsp), par_estruturas)
	{
		y+= sign(vsp);
	}
	vsp = 0;
}

y +=vsp;

if place_meeting(x, y+1, par_estruturas)
{
	
	pulos = 1;
	
}else
{
	vsp += grav;
}

if keyboard_check_pressed(vk_space) && pulos>0
{
	vsp = jspd;
	pulos--;
}