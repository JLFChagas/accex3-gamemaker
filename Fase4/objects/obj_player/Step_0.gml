// 1. Inputs de Movimento
var _dx = 0; 
if (keyboard_check(ord("A"))) { _dx = -speed_x; direction_facing = -1; }
if (keyboard_check(ord("D"))) { _dx = speed_x; direction_facing = 1; }

// 2. Lógica do Dash
if (keyboard_check_pressed(ord("E")) && can_dash && !is_dashing) {
    is_dashing = true;
    can_dash = false;
}
if (is_dashing) {
    _dx = dash_speed * direction_facing;
    is_dashing = false; 
}

// 3. Movimento e Colisão Horizontal
var _esfregando_na_parede = false;

if (place_meeting(x + _dx, y, obj_plataforma) && _dx != 0) {
    _esfregando_na_parede = true; // Se há colisão no caminho, ele está colando na parede!
    
    // Aproxima pixel por pixel até encostar perfeitamente (padrão do GameMaker)
    while (!place_meeting(x + sign(_dx), y, obj_plataforma)) {
        x += sign(_dx);
    }
    _dx = 0; // Zera o deslocamento horizontal para não atravessar
}
x += _dx; // Aplica o movimento restante

// Limita o X na tela
x = clamp(x, 0, room_width - sprite_width);
// 4. Gravidade e Escalada
vel_y += gravity_force; // Aplica a gravidade constante

// A escalada ativa se ele estiver esfregando na parede horizontalmente OU
// se já estiver grudado nela (checando 1 pixel para os lados) enquanto estiver no ar
var _parede_esquerda = place_meeting(x - 2, y, obj_plataforma);
var _parede_direita  = place_meeting(x + 2, y, obj_plataforma);
var _touching_side = (_esfregando_na_parede || _parede_esquerda || _parede_direita) && !is_on_ground;

// Se estiver tocando o lado e segurando W, escala!
if (_touching_side && keyboard_check(ord("W"))) {
    y -= climb_speed; // Sobe o player
    vel_y = 0;        // Cancela a gravidade para não escorregar
} else {
    y += vel_y;       // Queda livre ou pulo normal
}

// 5. Colisão Vertical (Chão e Teto)
if (place_meeting(x, y, obj_plataforma)) {
    if (vel_y > 0) { // Batendo no chão
        while (place_meeting(x, y, obj_plataforma)) { y -= 1; }
        is_on_ground = true;
        jumps_left = max_jumps; 
        can_dash = true;        
        vel_y = 0;
    }
    else if (vel_y < 0) { // Batendo no teto
        while (place_meeting(x, y, obj_plataforma)) { y += 1; }
        vel_y = 0;
    }
} else {
    if (!place_meeting(x, y + 1, obj_plataforma)) { is_on_ground = false; }
}

// 6. Comando de Pulo
// Só aceita o comando se o jogador apertar ESPAÇO, ou se apertar W e NÃO estiver escalando
if (keyboard_check_pressed(vk_space) || (keyboard_check_pressed(ord("W")) && !_touching_side)) {
    if (jumps_left > 0) {
        vel_y = jump_force;
        jumps_left -= 1;
        is_on_ground = false;
    }
}

// 7. Vitória e Derrota
if (place_meeting(x, y, obj_inimigo)) { obj_controlador.morreu = true; }
if (place_meeting(x, y, obj_porta)) { obj_controlador.passou = true; }