
// Obtener elementos
var modal = document.getElementById("myModal");
var btn = document.getElementById("openModalBtn");
var span = document.getElementsByClassName("close")[0];

// Abrir la ventana modal al hacer clic en el botón
btn.onclick = function () {
    $(modal).modal('show');
}

// Cerrar la ventana modal al hacer clic en la "x"
span.onclick = function () {
    $(modal).modal('hide');
}