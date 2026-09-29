// 1. Pega a posição X e Y atual da câmera no mundo
var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);

// 2. Pega a largura e altura do que o jogador está enxergando
var _cam_w = camera_get_view_width(view_camera[0]);
var _cam_h = camera_get_view_height(view_camera[0]);

// Configura o alinhamento do texto
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Se morreu, desenha acompanhando as coordenadas da câmera
if (morreu) {
    draw_set_color(make_color_rgb(255, 0, 0));
    // Desenha o retângulo usando a posição atual da câmera
    draw_rectangle(_cam_x, _cam_y, _cam_x + _cam_w, _cam_y + _cam_h, false);
    
    draw_set_color(c_white);
    draw_text(_cam_x + (_cam_w / 2), _cam_y + (_cam_h / 2), "Você morreu!! Pressione R para repetir");
}
// Se passou, desenha acompanhando as coordenadas da câmera
else if (passou) {
    draw_set_color(c_black);
    // Desenha o retângulo usando a posição atual da câmera
    draw_rectangle(_cam_x, _cam_y, _cam_x + _cam_w, _cam_y + _cam_h, false);
    
    draw_set_color(c_white);
    draw_text(_cam_x + (_cam_w / 2), _cam_y + (_cam_h / 2), "Parabens! Pressione R para Repetir.");
}