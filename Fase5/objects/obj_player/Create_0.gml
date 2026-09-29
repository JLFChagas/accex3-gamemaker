// Guarda posições de reinício
start_x = x;
start_y = y;

// Física ajustada para as proporções da Fase 5
vel_y = 0;
gravity_force = 0.5;
jump_force = -8;     // Pulo ligeiramente mais baixo
speed_x = 4;         // Velocidade lateral ajustada
dash_speed = 40;     // Força do dash reduzida para o mapa menor

// Estados e controles
is_on_ground = false;
is_dashing = false;
can_dash = true;
direction_facing = 1; 

max_jumps = 2;
jumps_left = max_jumps;
climb_speed = 4;