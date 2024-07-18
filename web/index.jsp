<%-- 
    Document   : index
    Created on : 11 jul. 2024, 12:32:22 a. m.
    Author     : sebas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Campo Verde</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous" />
    <link href="css/inicio.css" rel="stylesheet" type="text/css"/>
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

    <!-- Banner Carrusel -->
    <div class="d-flex justify-content-center">
        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="img/acercaa.jpeg" class="d-block w-100" alt="Imagen 1">
                </div>
                <div class="carousel-item">
                    <img src="img/tractor.jpg" class="d-block w-100" alt="Imagen 2">
                </div>
                <div class="carousel-item">
                    <img src="img/tractor.jpg" class="d-block w-100" alt="Imagen 3">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Anterior</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Siguiente</span>
            </button>
        </div>
    </div>

    <!-- Logos Servicios -->
    <main class="main-content">
        <section class="container container-features">
            <div class="card-feature">
                <i class="fa-solid fa-plane-up"></i>
                <div class="feature-content">
                    <span>Envío gratuito a nivel nacional</span>
                    <p>En pedidos superiores a S/150</p>
                </div>
            </div>
            <div class="card-feature">
                <i class="fa-solid fa-wallet"></i>
                <div class="feature-content">
                    <span>Contra reembolso</span>
                    <p>100% garantía de devolución de dinero</p>
                </div>
            </div>
            <div class="card-feature">
                <i class="fa-solid fa-gift"></i>
                <div class="feature-content">
                    <span>Tarjeta regalo especial</span>
                    <p>Ofrecemos bonos especiales con regalos</p>
                </div>
            </div>
            <div class="card-feature">
                <i class="fa-solid fa-headset"></i>
                <div class="feature-content">
                    <span>Servicio al cliente 24/7</span>
                    <p>Llame al 123-456-7890</p>
                </div>
            </div>
        </section>

        <!-- Mejores Ventas -->
        <section class="container top-products">
            <h1 class="heading-1">Mejores Ventas</h1>
            <div class="container-products">
                <!-- Producto 1 -->
                <div class="card-product">
                    <div class="container-img">
                        <img src="img/baca.jpeg" alt="Vaca" />
                        <span class="discount">-20%</span>
                        <div class="button-group">
                            <span><i class="fa-regular fa-eye"></i></span>
                            <span><i class="fa-regular fa-heart"></i></span>
                            <span><i class="fa-solid fa-code-compare"></i></span>
                        </div>
                    </div>
                    <div class="content-card-product">
                        <h3>Vaca</h3>
                        <a href="productoInicio.html" class="add-cart"><i class="fa-solid fa-basket-shopping"></i></a>
                        <p class="price">$400 <span>$500</span></p>
                    </div>
                </div>
                <!-- Producto 2 -->
                <div class="card-product">
                    <div class="container-img">
                        <img src="img/cerdo.jpeg" alt="Cerdo" />
                        <span class="discount">-10%</span>
                        <div class="button-group">
                            <span><i class="fa-regular fa-eye"></i></span>
                            <span><i class="fa-regular fa-heart"></i></span>
                            <span><i class="fa-solid fa-code-compare"></i></span>
                        </div>
                    </div>
                    <div class="content-card-product">
                        <h3>Cerdo</h3>
                        <a href="productoInicio.html" class="add-cart"><i class="fa-solid fa-basket-shopping"></i></a>
                        <p class="price">$270 <span>$300</span></p>
                    </div>
                </div>
                <!-- Producto 3 -->
                <div class="card-product">
                    <div class="container-img">
                        <img src="img/uva.jpg" alt="Uva" />
                        <div class="button-group">
                            <span><i class="fa-regular fa-eye"></i></span>
                            <span><i class="fa-regular fa-heart"></i></span>
                            <span><i class="fa-solid fa-code-compare"></i></span>
                        </div>
                    </div>
                    <div class="content-card-product">
                        <h3>Uva</h3>
                        <a href="productoInicio.html" class="add-cart"><i class="fa-solid fa-basket-shopping"></i></a>
                        <p class="price">$8.50</p>
                    </div>
                </div>
                <!-- Producto 4 -->
                <div class="card-product">
                    <div class="container-img">
                        <img src="img/palta.jpg" alt="Palta" />
                        <div class="button-group">
                            <span><i class="fa-regular fa-eye"></i></span>
                            <span><i class="fa-regular fa-heart"></i></span>
                            <span><i class="fa-solid fa-code-compare"></i></span>
                        </div>
                    </div>
                    <div class="content-card-product">
                        <h3>Palta</h3>
                        <a href="productoInicio.html" class="add-cart"><i class="fa-solid fa-basket-shopping"></i></a>
                        <p class="price">$4</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Blogs -->
        <section class="container blogs">
            <h1 class="heading-1">Nuestros Valores</h1><br>
            <div class="container-blogs">
                <div class="card-blog">
                    <div class="container-img">
                        <img src="img/respeto.png" alt="Imagen Blog 1" />
                        <div class="button-group-blog">
                            <span><i class="fa-solid fa-magnifying-glass"></i></span>
                            <span><i class="fa-solid fa-link"></i></span>
                        </div>
                    </div>
                    <div class="content-blog">
                        <h3>Respeto</h3>
                        <p>Respetamos y valoramos a todas las personas en la empresa, cumpliendo con las normas y políticas internas, velando por el buen clima laboral.</p>
                        <div class="btn-read-more">Leer más</div>
                    </div>
                </div>
                <div class="card-blog">
                    <div class="container-img">
                        <img src="img/innovacion.png" alt="Imagen Blog 2" />
                        <div class="button-group-blog">
                            <span><i class="fa-solid fa-magnifying-glass"></i></span>
                            <span><i class="fa-solid fa-link"></i></span>
                        </div>
                    </div>
                    <div class="content-blog">
                        <h3>Innovación</h3>
                        <p>Somos abiertos a los cambios, buscando la mejora continua y diferenciación competitiva a partir de la investigación, análisis y creatividad.</p>
                        <div class="btn-read-more">Leer más</div>
                    </div>
                </div>
                <div class="card-blog">
                    <div class="container-img">
                        <img src="img/trabajoequipo.png" alt="Imagen Blog 3" />
                        <div class="button-group-blog">
                            <span><i class="fa-solid fa-magnifying-glass"></i></span>
                            <span><i class="fa-solid fa-link"></i></span>
                        </div>
                    </div>
                    <div class="content-blog">
                        <h3>Trabajo en Equipo</h3>
                        <p>Buscamos la calidad integral de nuestros colaboradores, procesos y productos, de acuerdo a las actuales exigencias del mercado y la globalización.</p>
                        <div class="btn-read-more">Leer más</div>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <!-- Footer -->
    <footer class="footer">
        <div class="container container-footer">
            <div class="menu-footer">
                <div class="contact-info">
                    <p class="title-footer">Información de Contacto</p>
                    <ul>
                        <li>Dirección: 71 Pennington Lane Vernon Rockville, CT 06066</li>
                        <li>Teléfono: 123-456-7890</li>
                        <li>Fax: 55555300</li>
                        <li>Email: baristas@support.com</li>
                    </ul>
                </div>
                <div class="information">
                    <p class="title-footer">Información</p>
                    <ul>
                        <li><a href="nosotros.jsp">Acerca de Nosotros</a></li>
                        <li><a href="productoInicio.jsp">Productos</a></li>
                        <li><a href="#">Iniciar Sesión</a></li>
                        <li><a href="contactenos.jsp">Contáctanos</a></li>
                    </ul>
                </div>
                <div class="social-icons-container">
                    <div class="social-icons">
                        <p class="title-footer">Redes Sociales</p>
                        <span class="facebook"><i class="fa-brands fa-facebook-f"></i></span>
                        <span class="twitter"><i class="fa-brands fa-twitter"></i></span>
                        <span class="youtube"><i class="fa-brands fa-youtube"></i></span>
                        <span class="pinterest"><i class="fa-brands fa-pinterest-p"></i></span>
                        <span class="instagram"><i class="fa-brands fa-instagram"></i></span>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/81581fb069.js" crossorigin="anonymous"></script>
</body>

</html>
