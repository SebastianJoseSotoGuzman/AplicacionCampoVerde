<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Campo Verde</title>
        <link rel="stylesheet" href="css/inicio.css"
    </head>
    <body>
        <header>
        <div class="container-hero">
            <div class="container hero">
                <div class="container-logo">
                    <h1 class="logo"><a href="/">Campo Verde</a></h1>
                </div>
                <div class="container-user">
                    <i class="fa-solid fa-user"></i>
                    <i class="fa-solid fa-basket-shopping"></i>
                    <div class="content-shopping-cart">
                        <span class="text">Carrito</span>
                        <span class="number">(0)</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-navbar">
            <nav class="navbar container">
                <i class="fa-solid fa-bars"></i>
                <ul class="menu">
                    <li><a href="index.jsp">Inicio</a></li>
                    <li><a href="Productos.jsp">Productos</a></li>
                    <li><a href="Formulario02.jsp">Formulario</a></li>
                    <li><a href="contactenos.jsp">Contactenos</a></li>
                    <li><a href="nosotros.jsp">Nosotros</a></li>
                    <li><a href="login.jsp">Login</a></li>
                                        
                </ul>
            </nav>
        </div>
    </header>
    <section class="banner">
			<div class="content-banner">
				<p>Vive Sano</p>
				<h2>100% Natural</h2>
				<a href="#">Comprar ahora</a>
			</div>
		</section>
    <main class="main-content">
        <section class="container container-features">
            <div class="card-feature">
                <i class="fa-solid fa-plane-up"></i>
                <div class="feature-content">
                    <span>Envío gratuito a nivel nacional</span>
                    <p>En pedido superior a S/150</p>
                </div>
            </div>
            <div class="card-feature">
                <i class="fa-solid fa-wallet"></i>
                <div class="feature-content">
                    <span>Contrareembolso</span>
                    <p>100% garantía de devolución de dinero</p>
                </div>
            </div>
            <div class="card-feature">
                <i class="fa-solid fa-gift"></i>
                <div class="feature-content">
                    <span>Tarjeta regalo especial</span>
                    <p>Ofrece bonos especiales con regalo</p>
                </div>
            </div>
            <div class="card-feature">
                <i class="fa-solid fa-headset"></i>
                <div class="feature-content">
                    <span>Servicio al cliente 24/7</span>
                    <p>LLámenos 24/7 al 123-456-7890</p>
                </div>
            </div>
        </section>

        <section class="container top-categories">
            <h1 class="heading-1">Categorías</h1>
            <div class="container-categories">
                <div class="card-category category-agricola">
                    <p>Agricolas</p>
                    <span>Ver más</span>
                </div>
                <div class="card-category category-ganadero">
                    <p>Ganaderos</p>
                    <span>Ver más</span>
                </div>
                <div class="card-category category-servicio">
                    <p>Servicios</p>
                    <span>Ver más</span>
                </div>
            </div>
        </section>

        <section class="container top-products">
            <h1 class="heading-1">Mejores Ventas</h1>

            <div class="container-options">
                <span class="active">Destacados</span>
            </div>

            <div class="container-products">
                <!-- Producto 1 -->
                <div class="card-product">
                    <div class="container-img">
                        <img src="img/baca.jpeg" alt="vaca" />
                        <span class="discount">-5%</span>
                        <div class="button-group">
                            <span>
                                <i class="fa-regular fa-eye"></i>
                            </span>
                            <span>
                                <i class="fa-regular fa-heart"></i>
                            </span>
                            <span>
                                <i class="fa-solid fa-code-compare"></i>
                            </span>
                        </div>
                    </div>
                    <div class="content-card-product">
                        <h3>Vacas</h3>
                        <span class="add-cart">
                            <i class="fa-solid fa-basket-shopping"></i>
                        </span>
                        <p class="price">S/4.60 <span>S/5.30</span></p>
                    </div>
                </div>
                <!-- Producto 2 -->
                <div class="card-product">
                    <div class="container-img">
                        <img src="img/cerdo.jpeg" alt="Cerdo" />
                        <span class="discount">-5%</span>
                        <div class="button-group">
                            <span>
                                <i class="fa-regular fa-eye"></i>
                            </span>
                            <span>
                                <i class="fa-regular fa-heart"></i>
                            </span>
                            <span>
                                <i class="fa-solid fa-code-compare"></i>
                            </span>
                        </div>
                    </div>
                    <div class="content-card-product">
                        <h3>Cerdos</h3>
                        <span class="add-cart">
                            <i class="fa-solid fa-basket-shopping"></i>
                        </span>
                        <p class="price">S/5.70 <span>S/7.30</span></p>
                    </div>
                </div>
                <!-- Producto 3 -->
                <div class="card-product">
                    <div class="container-img">
                        <img src="img/uva.jpg" alt="uva" />
                        <span class="discount">-5%</span>
                        <div class="button-group">
                            <span>
                                <i class="fa-regular fa-eye"></i>
                            </span>
                            <span>
                                <i class="fa-regular fa-heart"></i>
                            </span>
                            <span>
                                <i class="fa-solid fa-code-compare"></i>
                            </span>
                        </div>
                    </div>
                    <div class="content-card-product">
                        <h3>Uva</h3>
                        <span class="add-cart">
                            <i class="fa-solid fa-basket-shopping"></i>
                        </span>
                        <p class="price">S/3.20</p>
                    </div>
                </div>
                <!-- Producto 4 -->
                <div class="card-product">
                    <div class="container-img">
                        <img src="img/palta.jpg" alt="Palta" />
                        <span class="discount">-5%</span>
                        <div class="button-group">
                            <span>
                                <i class="fa-regular fa-eye"></i>
                            </span>
                            <span>
                                <i class="fa-regular fa-heart"></i>
                            </span>
                                <i class="fa-solid fa-code-compare"></i>
                            </span>
                        </div>
                    </div>
                    <div class="content-card-product">
                        <h3>Palta</h3>
                        <span class="add-cart">
                            <i class="fa-solid fa-basket-shopping"></i>
                        </span>
                        <p class="price">S/5.60</p>
                    </div>
                </div>
            </div>
        </section>
        <section class="container blogs">
            <h1 class="heading-1">Informacion</h1>

            <div class="container-blogs">
                <div class="card-blog">
                    <div class="container-img">
                        <img src="img/acercaa.jpeg" alt="Imagen Blog 1" />
                        <div class="button-group-blog">
                            <span>
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </span>
                            <span>
                                <i class="fa-solid fa-link"></i>
                            </span>
                        </div>
                    </div>
                    <div class="content-blog">
                        <h3>Acerca de</h3>
                        <span>2 febrero 2024</span>
                        <p>
                            Campo Verde es una empresa agropecuaria dedicada a la producción y comercialización de productos agrícolas y ganaderos.
                            Nos destacamos por nuestro compromiso con la calidad, la sostenibilidad y la innovación en todas nuestras operaciones. 
                            Desde la siembra y el cuidado de los cultivos hasta el manejo del ganado y la distribución, mantenemos altos estándares 
                            en cada etapa del proceso.

                            Promovemos prácticas sostenibles para minimizar el impacto ambiental y asegurar el bienestar animal. Además, utilizamos
                            tecnología avanzada para mejorar la eficiencia operativa y la toma de decisiones.
                        </p>
                        <div class="btn-read-more">Leer más</div>
                    </div>
                </div>
                <div class="card-blog">
                    <div class="container-img">
                        <img src="img/mision.jpg" alt="Imagen Blog 2" />
                        <div class="button-group-blog">
                            <span>
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </span>
                            <span>
                                <i class="fa-solid fa-link"></i>
                            </span>
                        </div>
                    </div>
                    <div class="content-blog">
                        <h3>Mision</h3>
                        <span>2 febrero 2024</span>
                        <p>
                            La misión de la empresa agropecuaria "Campo Verde" es producir y comercializar productos 
                            agrícolas y ganaderos de alta calidad, mientras se compromete con la eficiencia operativa 
                            y el uso de tecnología para mejorar la gestión de sus operaciones. Busca satisfacer las necesidades 
                            de sus clientes, garantizando la salud y bienestar del ganado y promoviendo prácticas agrícolas sostenibles.     
                        </p>
                        <div class="btn-read-more">Leer más</div>
                    </div>
                </div>
                <div class="card-blog">
                    <div class="container-img">
                        <img src="img/vis.png" alt="Imagen Blog 3" />
                        <div class="button-group-blog">
                            <span>
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </span>
                            <span>
                                <i class="fa-solid fa-link"></i>
                            </span>
                        </div>
                    </div>
                    <div class="content-blog">
                        <h3>Vision</h3>
                        <span>2 febrero 2024</span>
                        <p>
                           : La visión de "Campo Verde" es convertirse en un referente en el sector agropecuario, reconocido por su excelencia
                           en la producción y comercialización de productos de calidad, así como por su compromiso con la innovación y el desarrollo
                           tecnológico. Aspira a ser líder en el uso de plataformas tecnológicas integradas que impulsen la eficiencia operativa y la 
                           toma de decisiones estratégicas, contribuyendo al crecimiento sostenible de la empresa y al bienestar de la comunidad.
                        </p>
                        <div class="btn-read-more">Leer más</div>
                    </div>
                </div>
            </div>
        </section>
    </main>

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
                    <div class="social-icons">
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

                <div class="information">
                    <p class="title-footer">Información</p>
                    <ul>
                        <li><a href="#">Acerca de Nosotros</a></li>
                        <li><a href="#">Información Delivery</a></li>
                        <li><a href="#">Politicas de Privacidad</a></li>
                        <li><a href="#">Términos y condiciones</a></li>
                        <li><a href="#">Contactános</a></li>
                    </ul>
                </div>

                <div class="my-account">
                    <p class="title-footer">Mi cuenta</p>

                    <ul>
                        <li><a href="#">Mi cuenta</a></li>
                        <li><a href="#">Historial de ordenes</a></li>
                        <li><a href="#">Lista de deseos</a></li>
                        <li><a href="#">Boletín</a></li>
                        <li><a href="#">Reembolsos</a></li>
                    </ul>
                </div>

                <div class="newsletter">
                    <p class="title-footer">Boletín informativo</p>

                    <div class="content">
                        <p>
                            Suscríbete a nuestros boletines ahora y mantente al
                            día con nuevas colecciones y ofertas exclusivas.
                        </p>
                        <input type="email" placeholder="Ingresa el correo aquí...">
                        <button>Suscríbete</button>
                    </div>
                </div>
            </div>

            <div class="copyright">
                <p>
                    CampoVerde SebastianSotoGuzman &copy; 2022
                </p>
            </div>
        </div>
    </footer>

    <script src="https://kit.fontawesome.com/81581fb069.js" crossorigin="anonymous"></script>
    </body>
</html>