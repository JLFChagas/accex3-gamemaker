// Se o jogo acabou, congela as atualizações
if (obj_controlador.morreu || obj_controlador.passou) return;

// --- 1. Entrada de Comandos (handle_input) ---
var _dx = 0;
if (keyboard_check(ord("A"))) { _dx = -speed_x; direction_facing = -1; }
if (keyboard_check(ord("D"))) { _dx = speed_x; direction_facing = 1; }

// --- 2. Lógica do Dash (start_dash) ---
if (keyboard_check_pressed(ord("E")) && can_dash && !is_dashing) {
    is_dashing = true;
    can_dash = false;
}
if (is_dashing) {
    _dx = dash_speed * direction_facing;
    is_dashing = false; 
}

// --- 3. Colisão Horizontal (check_horizontal_collision) ---
x += _dx;
x = clamp(x, 0, room_width - sprite_width); // Limita ao tamanho total da Room

if (place_meeting(x, y, obj_plataforma)) {
    while (place_meeting(x, y, obj_plataforma)) {
        x -= sign(_dx);
    }
}

// --- 4. Gravidade e Escalada (check_climb) ---
vel_y += gravity_force;

var _parede_esquerda = place_meeting(x - 2, y, obj_plataforma);
var _parede_direita  = place_meeting(x + 2, y, obj_plataforma);
var _touching_side = (_parede_esquerda || _parede_direita) && !is_on_ground;

if (_touching_side && keyboard_check(ord("W"))) {
    y -= climb_speed;
    vel_y = 0; 
} else {
    y += vel_y;
}

// --- 5. Colisão Vertical (check_vertical_collision) ---
if (place_meeting(x, y, obj_plataforma)) {
    if (vel_y > 0) { // Pouso
        while (place_meeting(x, y, obj_plataforma)) { y -= 1; }
        is_on_ground = true;
        jumps_left = max_jumps; 
        can_dash = true;        
        vel_y = 0;
    }
    else if (vel_y < 0) { // Cabeçada
        while (place_meeting(x, y, obj_plataforma)) { y += 1; }
        vel_y = 0;
    }
} else {
    if (!place_meeting(x, y + 1, obj_plataforma)) { is_on_ground = false; }
}

// --- 6. Comando de Pulo (jump) ---
if (keyboard_check_pressed(vk_space) || (keyboard_check_pressed(ord("W")) && !_touching_side)) {
    if (jumps_left > 0) {
        vel_y = jump_force;
        jumps_left -= 1;
        is_on_ground = false;
    }
}

// --- 7. Verificação de Objetivos ---
if (place_meeting(x, y, obj_inimigo)) { obj_controlador.morreu = true; }
if (place_meeting(x, y, obj_porta)) { obj_controlador.passou = true; }