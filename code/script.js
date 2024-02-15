document.addEventListener('DOMContentLoaded', function() {
    var botao = document.getElementById('botao');
    var textoInput = document.getElementById('textoInput');

    botao.addEventListener('click', function() {
        var texto = textoInput.value;
        if (texto.trim() !== '') {
            alert('Você digitou: ' + texto);
        } else {
            alert('Por favor, digite algo no campo de texto.');
        }
    });
});
