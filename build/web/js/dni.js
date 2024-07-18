$(document).ready(function () {
    $("#dni").on("input", function () {
        this.value = this.value.replace(/[^\d]/g, ''); // Elimina caracteres que no sean números
    });

    $("#prueba").click(function () {
        var dni = $("#dni").val();
        $.ajax({
            type: "POST",
            url: "ConsultaDniServlet", // Nombre del servlet Java que manejará la solicitud
            data: {dni: dni},
            dataType: "json",
            success: function (data) {
                if (data.error) {
                    alert(data.error);
                } else {
                    $("#nombres").val(data.nombres);
                    $("#apellidos").val(data.apellidoPaterno + " " + data.apellidoMaterno);
                }
            },
            error: function (xhr, status, error) {
                console.log("Error:", error);
            }
        });
    });
});