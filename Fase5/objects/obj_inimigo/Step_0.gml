// Se o jogo acabou, para o inimigo
if (obj_controlador.morreu || obj_controlador.passou) {
    exit; // Sai do código para ele não se mover na tela de morte
}

// Movimento normal de patrulha
x += speed_x;

// Checa os limites individuais que você configurou
if (x <= limit_left || (x + sprite_width) >= limit_right) {
    speed_x *= -1; // Inverte a direção
}