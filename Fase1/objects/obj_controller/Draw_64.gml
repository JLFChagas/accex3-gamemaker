if (global.passou) {
    // 1. Desenha o fundo preto cobrindo a tela inteira
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

    // 2. Configura a cor e o alinhamento do texto para o centro
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // 3. Cria as variáveis e calcula o exato centro da tela
    // A palavra 'var' é obrigatória aqui para que o GameMaker reconheça a variável
    var _centro_x = display_get_gui_width() / 2;
    var _centro_y = display_get_gui_height() / 2;
    
    // 4. Desenha o texto utilizando as variáveis calculadas acima
    draw_text(_centro_x, _centro_y, "Parabens! Voce passou de fase! Pressione R para repetir.");
    
    // 5. Reseta o alinhamento para não bagunçar o desenho de outros objetos
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}