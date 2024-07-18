<%-- 
    Document   : contactenos
    Created on : 11 jul. 2024, 12:33:04 a. m.
    Author     : sebas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contáctenos</title>
    <link rel="stylesheet" href="css/inicio.css">
    <link rel="stylesheet" href="css/contactenos.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script> <!-- Añadir iconos de FontAwesome -->
</head>

<body>
    <!-- Header -->
    <header>
        <div class="container-header">
            <div class="logo">
                <h1><a href="index.jsp">Campo Verde</a></h1>
            </div>
            <nav class="navbar">
                <ul class="menu">
                    <li><a href="index.jsp">Inicio</a></li>
                    <li><a href="productoInicio.jsp">Productos</a></li>
                    <li><a href="nosotros.jsp">Nosotros</a></li>
                    <li><a href="contactenos.jsp">Contáctenos</a></li>
                    <li><a href="login.jsp">Login</a></li>
                </ul>
            </nav>
            <div class="container-user">
                <i class="fa-solid fa-user"></i>
                <a href="productoInicio.jsp" id="cart-link"><i class="fa-solid fa-basket-shopping"></i></a>
                <div class="content-shopping-cart"></div>
            </div>
        </div>
</header>
    <section class="contact-section">
        <h2>Contáctenos</h2>
        <p>Si tienes alguna pregunta o comentario, por favor llena el siguiente formulario y nos pondremos en contacto
            contigo lo antes posible.</p>
        <div class="contact-container">
            <form action="#" method="post" class="contact-form">
                <div class="form-group">
                    <label for="name">Nombre:</label>
                    <input type="text" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="email">Correo Electrónico:</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="subject">Asunto:</label>
                    <input type="text" id="subject" name="subject" required>
                </div>
                <div class="form-group">
                    <label for="message">Mensaje:</label>
                    <textarea id="message" name="message" rows="5" required></textarea>
                </div>
                <button type="submit" class="submit-button">Enviar</button>
            </form>
            <div class="contact-info">
                <h3>Información de Contacto</h3>
                <p><i class="fa fa-map-marker-alt"></i> Dirección: G527+P63, Campoverde 25500</p>
                <p><i class="fa fa-phone"></i> Teléfono: 123-456-7890</p>
                <p><i class="fa fa-fax"></i> RUC: 20393069997</p>
                <p><i class="fa fa-envelope"></i> Email: poro@support.com</p>
                <div class="social-icons">
                    <span class="facebook"><i class="fa-brands fa-facebook-f"></i></span>
                    <span class="twitter"><i class="fa-brands fa-twitter"></i></span>
                    <span class="youtube"><i class="fa-brands fa-youtube"></i></span>
                    <span class="pinterest"><i class="fa-brands fa-pinterest-p"></i></span>
                    <span class="instagram"><i class="fa-brands fa-instagram"></i></span>
                </div>
            </div>
        </div>
        <div class="map-container">
            <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d22975.983824908544!2d-74.84410262322912!3d-8.499502882182217!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x91a38d00006edcd1%3A0x458bef2b2074cb30!2sAGROPECUARIA%20CAMPO%20VERDE!5e0!3m2!1ses-419!2spe!4v1720536076014!5m2!1ses-419!2spe"
                width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
        </div>
    </section>
    <footer class="footer">
        <div class="container container-footer">
            <div class="menu-footer">
                <div class="contact-info">
                    <p class="title-footer">Información de Contacto</p>
                    <ul>
                        <li>Dirección: G527+P63, Campoverde 25500</li>
                        <li>Teléfono: 123-456-7890</li>
                        <li>RUC: 20393069997</li>
                        <li>EmaiL: poro@support.com</li>
                    </ul>
                </div>
                <div class="information">
                    <p class="title-footer">Información</p>
                    <ul>
                        <li><a href="nosotros.jsp">Acerca de Nosotros</a></li>
                        <li><a href="productoInicio.jsp">Productos</a></li>
                        <li><a href="#">Iniciar Sesion</a></li>
                        <li><a href="contactenos.jsp">Contactános</a></li>
                    </ul>
                </div>
                <div class="social-icons-container">
                    <div class="social-icons">
                        <p class="title-footer">Redes Sociales</p>
                        <span class="facebook">
                            <i class="fa-brands fa-facebook-f"></i>
                        </span>
                        <span class="twitter">
                            <i class="fa-brands fa-twitter"></i>
                        </span>
                        <span class="youtube">
                            <i class="fa-brands fa-youtube"></i>
                        </span>
                        <span class="pinterest">
                            <i class="fa-brands fa-pinterest-p"></i>
                        </span>
                        <span class="instagram">
                            <i class="fa-brands fa-instagram"></i>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <script src="https://kit.fontawesome.com/81581fb069.js" crossorigin="anonymous"></script>
</body>

</html>