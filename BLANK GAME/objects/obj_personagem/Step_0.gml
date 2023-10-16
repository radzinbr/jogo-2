/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var key_left = keyboard_check(vk_left)
var key_right = keyboard_check(vk_right)
var key_left = keyboard_check(vk_left)


var move = key_right - key_left 

hvel = move * spd 
if key_left or key_right {
	situacao = "andando"
}else {
	situacao = "parado"
	}

vvel = vvel + global.gravidade
 
if (hvel != 0) image_xscale = sign(hvel)

#region colisao

if place_meeting(x + hvel,y,Obj_bloco){
while (!place_meeting(x+sign(hvel),y,Obj_bloco)){
	x = x+ sign(hvel)
}

}
x= x + hvel
if place_meeting(x,y+vvel,Obj_bloco){
while (!place_meeting(x,y+sign(vvel),Obj_bloco)){
	y = y+ sign(vvel)
}
	 vvel = 0
}
y = y + vvel



#endregion 

#region animaçao 
situacoes = ds_map_create();
ds_map_add(situacoes, "andando", spr_personagem_andando);
ds_map_add(situacoes, "parado", spr_personagem_parado);
sprite_index = ds_map_find_value(situacoes, situacao);
#endregion