// Monitora a tecla R se o jogador ganhou ou perdeu
if ((morreu || passou) && keyboard_check_pressed(ord("R"))) {
    
    // 1. Desliga os estados imediatamente para o Draw parar de pintar as telas coloridas
    morreu = false;
    passou = false;
    
    // 2. Traz os objetos paralisados de volta à vida
    instance_activate_all(); 
    
    // 3. Reposiciona o Player nas coordenadas iniciais
    if (instance_exists(obj_player)) {
        obj_player.x = obj_player.start_x;
        obj_player.y = obj_player.start_y;
        obj_player.vel_y = 0;
        obj_player.is_on_ground = false;
        obj_player.jumps_left = obj_player.max_jumps;
        obj_player.can_dash = true;
        obj_player.is_dashing = false;
    }
    
    // 4. Reposiciona o Inimigo
    if (instance_exists(obj_inimigo)) {
        obj_inimigo.x = obj_inimigo.start_x;
        obj_inimigo.y = obj_inimigo.start_y;
        obj_inimigo.speed_x = 0; 
    }
}

// Bloqueia os objetos se o jogo terminar (e o R não tiver sido apertado)
if (morreu || passou) {
    instance_deactivate_object(obj_player);
    instance_deactivate_object(obj_inimigo);
}