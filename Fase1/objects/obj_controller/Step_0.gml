// Se ganhou o jogo e apertou R, reinicia a fase
if (global.passou) {
    if (keyboard_check_pressed(ord("R"))) {
        global.passou = false;
        room_restart(); // Substitui a sua função reiniciar_jogo()
    }
}