x += speed_x;

// Se ele for para a esquerda e passar do limite, inverte para a direita
if (x <= limit_left && speed_x < 0) {
    speed_x = 8; // Fica positivo (vai para a direita)
    x = limit_left; 
}

// Se ele for para a direita e passar do limite, inverte para a esquerda
if ((x + sprite_width) >= limit_right && speed_x > 0) {
    speed_x = -8; // Fica negativo (vai para a esquerda)
    x = limit_right - sprite_width; 
}