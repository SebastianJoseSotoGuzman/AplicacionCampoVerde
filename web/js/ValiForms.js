(function () {
    'use strict';
    window.addEventListener('load', function () {
        // Obtener todos los formularios a los que queremos aplicar estilos de validación de Bootstrap personalizados
        var forms = document.getElementsByClassName('needs-validation');
        // Bucle sobre ellos y evitar el envío
        var validation = Array.prototype.filter.call(forms, function (form) {
            form.addEventListener('submit', function (event) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
        });
    }, false);
})();