// Posição inicial para reset
start_x = x;
start_y = y;

// Física da Fase 4
vel_y = 0;
gravity_force = 0.5;
jump_force = -10;     
speed_x = 5;          
dash_speed = 100;     

// Estados do jogador
is_on_ground = false;
is_dashing = false;
can_dash = true;
direction_facing = 1; // 1 = Direita, -1 = Esquerda

// Pulo duplo e Escalada
max_jumps = 2;
jumps_left = max_jumps;
climb_speed = 4;