if (!global.passou) {
    
    // --- 1. CONTROLES DE MOVIMENTO HORIZONTAL ---
    var _tecla_direita = keyboard_check(vk_right) || keyboard_check(ord("D"));
    var _tecla_esquerda = keyboard_check(vk_left) || keyboard_check(ord("A"));
    
    var _direcao = _tecla_direita - _tecla_esquerda;
    vel_x = _direcao * velocidade;

    // Colisão Horizontal com o chão/paredes
    if (place_meeting(x + vel_x, y, obj_chao)) {
        while (!place_meeting(x + sign(vel_x), y, obj_chao)) {
            x += sign(vel_x);
        }
        vel_x = 0; 
    }
    x += vel_x;

    // --- 2. CONTROLES VERTICAIS (GRAVIDADE E PULO) ---
    vel_y += gravidade;

    if (place_meeting(x, y + 1, obj_chao)) {
        if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("W"))) {
            vel_y = forca_pulo;
        }
    }

    if (place_meeting(x, y + vel_y, obj_chao)) {
        while (!place_meeting(x, y + sign(vel_y), obj_chao)) {
            y += sign(vel_y);
        }
        vel_y = 0;
    }
    y += vel_y;

    // --- 3. CHECAGEM DE VITÓRIA ---
    if (place_meeting(x, y, obj_porta)) {
        global.passou = true;
    }
}