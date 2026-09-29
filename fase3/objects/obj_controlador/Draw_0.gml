// Alinha o texto perfeitamente pelo centro (horizontal e vertical)
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (morreu) {
    // 1. Pinta a tela de Vermelho
    draw_clear(make_color_rgb(255, 0, 0)); 
    
    // 2. Define a cor do texto para Branco
    draw_set_color(c_white);
    
    // 3. Desenha o texto bem no centro da tela
    draw_text(room_width / 2, room_height / 2, "Você morreu!! Pressione R para repetir");
}
else if (passou) {
    // 1. Pinta a tela de Preto
    draw_clear(c_black); 
    
    // 2. Define a cor do texto para Branco
    draw_set_color(c_white);
    
    // 3. Desenha o texto bem no centro da tela
    draw_text(room_width / 2, room_height / 2, "Parabéns! Pressione R para Repetir.");
}