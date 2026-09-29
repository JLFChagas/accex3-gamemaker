x += speed_x;

// Inverte a direção ao tocar os limites
if (x <= limit_left || (x + sprite_width) >= limit_right) {
    speed_x *= -1;
}