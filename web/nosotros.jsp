<%-- 
    Document   : nosotros
    Created on : 11 jul. 2024, 12:33:40 a. m.
    Author     : sebas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nosotros</title>
    <link rel="stylesheet" href="css/inicio.css">
    <link rel="stylesheet" href="css/nosotros.css">
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
    <section class="about-section">
        <div class="about-container">
            <div class="about-image">
                <img src="img/Nosotros.jpg" alt="Nuestro Equipo">
            </div>
            <div class="about-content">
                <h2>Sobre Nosotros</h2>
                <p>Campo Verde es una empresa agropecuaria dedicada a la producción y comercialización de productos
                    agrícolas y ganaderos. Nos destacamos por nuestro compromiso con la calidad, la sostenibilidad y la
                    innovación en todas nuestras operaciones. Desde la siembra y el cuidado de los cultivos hasta el
                    manejo del ganado y la distribución, mantenemos altos estándares en cada etapa del proceso.</p>
                <p>Promovemos prácticas sostenibles para minimizar el impacto ambiental y asegurar el bienestar animal.
                    Además, utilizamos tecnología avanzada para mejorar la eficiencia operativa y la toma de decisiones.
                </p>
            </div>
        </div>
        <div class="mission-vision-container">
            <div class="mission">
                <h2>Misión</h2>
                <p>La misión de la empresa agropecuaria "Campo Verde" es producir y comercializar productos agrícolas y
                    ganaderos de alta calidad, mientras se compromete con la eficiencia operativa y el uso de tecnología
                    para mejorar la gestión de sus operaciones. Busca satisfacer las necesidades de sus clientes,
                    garantizando la salud y bienestar del ganado y promoviendo prácticas agrícolas sostenibles.</p>
            </div>
            <div class="vision">
                <h2>Visión</h2>
                <p>La visión de "Campo Verde" es convertirse en un referente en el sector agropecuario, reconocido por
                    su excelencia en la producción y comercialización de productos de calidad, así como por su
                    compromiso con la innovación y el desarrollo tecnológico. Aspira a ser líder en el uso de
                    plataformas tecnológicas integradas que impulsen la eficiencia operativa y la toma de decisiones
                    estratégicas, contribuyendo al crecimiento sostenible de la empresa y al bienestar de la comunidad.
                </p>
            </div>
        </div>
    </section>
    <footer class="footer">
        <div class="container container-footer">
            <div class="menu-footer">
                <div class="contact-info">
                    <p class="title-footer">Información de Contacto</p>
                    <ul>
                        <li>
                            Dirección: 71 Pennington Lane Vernon Rockville, CT
                            06066
                        </li>
                        <li>Teléfono: 123-456-7890</li>
                        <li>Fax: 55555300</li>
                        <li>EmaiL: baristas@support.com</li>
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