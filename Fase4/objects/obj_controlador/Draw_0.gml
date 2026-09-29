draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _gui_width = display_get_gui_width();
var _gui_height = display_get_gui_height();

// Só desenha se a variável for verdadeira
if (morreu) {
    // Desenha um retângulo vermelho cobrindo a tela toda
    draw_set_color(make_color_rgb(255, 0, 0));
    draw_rectangle(0, 0, _gui_width, _gui_height, false);
    
    // Escreve o texto em branco por cima
    draw_set_color(c_white);
    draw_text(_gui_width / 2, _gui_height / 2, "Você morreu!! Pressione R para repetir");
}
else if (passou) {
    // Desenha um retângulo preto cobrindo a tela toda
    draw_set_color(c_black);
    draw_rectangle(0, 0, _gui_width, _gui_height, false);
    
    // Escreve o texto em branco por cima
    draw_set_color(c_white);
    draw_text(_gui_width / 2, _gui_height / 2, "Parabens! Pressione R para Repetir.");
}