let boton = document.getElementById("boton");
boton.addEventListener("click", traerDatos);

function traerDatos() {
    let dni = document.getElementById("dni").value;
    fetch("https://apiperu.dev/api/dni/" +
            dni + "?api_token=fa1abbdf9e5d072c51295d6b13192d6035f864966ecfb1b73eb4b687374f3fa5")

            .then((datos) => datos.json())
            .then((datos) => {
                // console.log(datos.data);
                document.getElementById("txtNombre").value = datos.data.nombre_completo;

            });
}
/*$(document).ready(function () {
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
                    $("#txtNombre").val(data.apellidoPaterno + " " + data.apellidoMaterno + " " + data.nombres);

                }
            },
            error: function (xhr, status, error) {
                console.log("Error:", error);
            }
        });
    });
});
 * 
 * 
 */