// Verifica se o jogo acabou e o jogador pressionou a tecla 'R'
if ((morreu || passou) && keyboard_check_pressed(ord("R"))) {
    
    // 1. PRIMEIRO: Reativa todo mundo para que eles voltem a existir na memória
    instance_activate_all();
    
    // Reseta os estados do controlador
    morreu = false;
    passou = false;
    
    // 2. SEGUNDO: Agora que eles existem de novo, mudamos as posições
    if (instance_exists(obj_player)) {
        obj_player.x = obj_player.start_x;
        obj_player.y = obj_player.start_y;
        obj_player.vel_y = 0;
        obj_player.is_on_ground = false;
    }
    
    if (instance_exists(obj_inimigo)) {
        obj_inimigo.x = obj_inimigo.start_x;
        obj_inimigo.y = obj_inimigo.start_y;
        obj_inimigo.speed_x = -8; // Garante que volta andando para a esquerda
    }
}

// Se o jogo acabou (e o R não foi pressionado ainda), paralisa o jogo
if (morreu || passou) {
    instance_deactivate_object(obj_player);
    instance_deactivate_object(obj_inimigo);
}