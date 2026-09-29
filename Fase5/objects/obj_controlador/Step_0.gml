// 1. LÓGICA DE REINICIAR (TECLA R)
if ((morreu || passou) && keyboard_check_pressed(ord("R"))) {
    
    // Limpa os estados ANTES de qualquer outra coisa
    morreu = false;
    passou = false;

    // REATIVA TUDO (Caso tenha usado deactivation)
    instance_activate_all(); 

    // RESET DO PLAYER
    if (instance_exists(obj_player)) {
        obj_player.x = obj_player.start_x;
        obj_player.y = obj_player.start_y;
        obj_player.vel_y = 0;
        obj_player.is_on_ground = false;
        obj_player.jumps_left = obj_player.max_jumps;
        obj_player.can_dash = true;
        obj_player.is_dashing = false;
        // Importante: força a visibilidade caso tenha sumido
        obj_player.visible = true; 
    }
    
    // RESET DO INIMIGO (Forçando a velocidade de patrulha de volta)
    if (instance_exists(obj_inimigo)) {
        obj_inimigo.x = obj_inimigo.start_x;
        obj_inimigo.y = obj_inimigo.start_y;
        obj_inimigo.speed_x = 3; // Força a velocidade inicial da Fase 5 (Pygame)
    }

    // RESET DA CÂMERA (Faz a câmera pular de volta para o início instantaneamente)
    view_xport[0] = 0;
    camera_set_view_pos(view_camera[0], 0, 0);
}