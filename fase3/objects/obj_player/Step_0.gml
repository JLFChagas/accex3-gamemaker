// 1. Movimento Horizontal (Checando as teclas A e D)
var _move_x = 0;
if (keyboard_check(ord("A"))) _move_x -= 1;
if (keyboard_check(ord("D"))) _move_x += 1;

x += _move_x * speed_x;

// Manter nos limites da Room (0 até a largura da tela)
x = clamp(x, 0, room_width - sprite_width);

// 2. Gravidade
vel_y += gravity_force;
y += vel_y;

// 3. Colisão Simples (Apenas com o obj_plataforma)
// Como a origem do player é Bottom-Left, a base dele é o próprio 'y'
if (place_meeting(x, y, obj_plataforma)) {
    // Procura a plataforma abaixo dele
    var _plataforma = instance_place(x, y, obj_plataforma);
    if (_plataforma != noone) {
        y = _plataforma.y; // Coloca o player exatamente em cima do chão
        vel_y = 0;
        is_on_ground = true;
    }
} else {
    is_on_ground = false;
}

// 4. Pulo (Teclas Espaço ou W)
if (is_on_ground) {
    if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("W"))) {
        vel_y = jump_force;
        is_on_ground = false;
    }
}

// 5. Colisões com Perda ou Vitória (Troca o estado do controlador global)
if (place_meeting(x, y, obj_inimigo)) {
    obj_controlador.morreu = true;
}

if (place_meeting(x, y, obj_porta)) {
    obj_controlador.passou = true;
}