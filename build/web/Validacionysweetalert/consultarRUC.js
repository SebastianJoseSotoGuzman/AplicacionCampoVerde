let boton = document.getElementById("boton");
boton.addEventListener("click", traerDatos);

function traerDatos() {
    let dni = document.getElementById("txtdoc").value;
    fetch("https://apiperu.dev/api/ruc/" +
            dni + "?api_token=fa1abbdf9e5d072c51295d6b13192d6035f864966ecfb1b73eb4b687374f3fa5")

            .then((datos) => datos.json())
            .then((datos) => {
               console.log(datos.data);
               document.getElementById("Txtacliente").value = datos.data.nombre_o_razon_social;
               document.getElementById("Txtdireccion").value = datos.data.direccion_completa;
            });
}