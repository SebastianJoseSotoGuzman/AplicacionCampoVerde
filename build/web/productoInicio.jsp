<%-- 
    Document   : productoInicio
    Created on : 11 jul. 2024, 12:32:35 a. m.
    Author     : sebas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Productos Campo Verde</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="css/productoInicio.css" />
    <script src="js/appcarrito.js" async></script>
</head>

<body>
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

    <!-- Contenedor de elementos -->
    <div class="filter-buttons">
        <button onclick="showProducts('agricolas')">Productos Agrícolas</button>
        <button onclick="showProducts('ganaderos')">Productos Ganaderos</button>
    </div>

    <section class="contenedor">
        <div class="contenedor-items">
            <div class="item product-agricolas">
                <span class="titulo-item">Fresa</span>
                <img src="img/fresas.jpg" alt="Fresa" class="img-item">
                <span class="precio-item">$15.00</span>
                <button class="boton-item">Agregar al Carrito</button>
            </div>
            <div class="item product-agricolas">
                <span class="titulo-item">Plátano</span>
                <img src="img/platanos.jpg" alt="Plátano" class="img-item">
                <span class="precio-item">$6.00</span>
                <button class="boton-item">Agregar al Carrito</button>
            </div>
            <div class="item product-agricolas">
                <span class="titulo-item">Mango</span>
                <img src="img/mango.jpeg" alt="Mango" class="img-item">
                <span class="precio-item">$15.00</span>
                <button class="boton-item">Agregar al Carrito</button>
            </div>
            <div class="item product-agricolas">
                <span class="titulo-item">Naranja</span>
                <img src="img/naranja.jpg" alt="Naranja" class="img-item">
                <span class="precio-item">$18.00</span>
                <button class="boton-item">Agregar al Carrito</button>
            </div>
            <div class="item product-agricolas">
                <span class="titulo-item">Palta</span>
                <img src="img/palta.jpg" alt="Palta" class="img-item">
                <span class="precio-item">$4.00</span>
                <button class="boton-item">Agregar al Carrito</button>
            </div>
            <div class="item product-agricolas">
                <span class="titulo-item">Pitahaya</span>
                <img src="img/pitahaya.jpg" alt="Pitahaya" class="img-item">
                <span class="precio-item">$30.00</span>
                <button class="boton-item">Agregar al Carrito</button>
            </div>
            <div class="item product-agricolas">
                <span class="titulo-item">Uva</span>
                <img src="img/uva.jpg" alt="Uva" class="img-item">
                <span class="precio-item">$30.00</span>
                <button class="boton-item">Agregar al Carrito</button>
            </div>
            <div class="item product-agricolas">
                <span class="titulo-item">Granadilla</span>
                <img src="img/granadilla.jpg" alt="Granadilla" class="img-item">
                <span class="precio-item">$20.00</span>
                <button class="boton-item">Agregar al Carrito</button>
            </div>
            <div class="item product-ganaderos">
                <span class="titulo-item">Vaca</span>
                <img src="img/baca.jpeg" alt="Vaca" class="img-item">
                <span class="precio-item">$400.00</span>
                <button class="boton-item">Agregar al Carrito</button>
            </div>
            <div class="item product-ganaderos">
                <span class="titulo-item">Cerdo</span>
                <img src="img/cerdo.jpeg" alt="Cerdo" class="img-item">
                <span class="precio-item">$270.00</span>
                <button class="boton-item">Agregar al Carrito</button>
            </div>
            <div class="item product-ganaderos">
                <span class="titulo-item">Pollo</span>
                <img src="img/pollo.jpg" alt="Pollo" class="img-item">
                <span class="precio-item">$120.00</span>
                <button class="boton-item">Agregar al Carrito</button>
            </div>
            <div class="item product-ganaderos">
                <span class="titulo-item">Pato</span>
                <img src="img/patos.jpg" alt="Pato" class="img-item">
                <span class="precio-item">$120.00</span>
                <button class="boton-item">Agregar al Carrito</button>
            </div>
        </div>

        <!-- Carrito de Compras -->
        <div class="carrito" id="carrito">
            <div class="header-carrito">
                <h2>Tu Carrito</h2>
            </div>
            <div class="carrito-items">
                <!-- Ejemplo de item en el carrito -->
                <!-- 
                <div class="carrito-item">
                    <img src="img/boxengasse.png" width="80px" alt="Box Engasse">
                    <div class="carrito-item-detalles">
                        <span class="carrito-item-titulo">Box Engasse</span>
                        <div class="selector-cantidad">
                            <i class="fa-solid fa-minus restar-cantidad"></i>
                            <input type="text" value="1" class="carrito-item-cantidad" disabled>
                            <i class="fa-solid fa-plus sumar-cantidad"></i>
                        </div>
                        <span class="carrito-item-precio">$15.000,00</span>
                    </div>
                    <span class="btn-eliminar">
                        <i class="fa-solid fa-trash"></i>
                    </span>
                </div>
                <div class="carrito-item">
                    <img src="img/skinglam.png" width="80px" alt="Skin Glam">
                    <div class="carrito-item-detalles">
                        <span class="carrito-item-titulo">Skin Glam</span>
                        <div class="selector-cantidad">
                            <i class="fa-solid fa-minus restar-cantidad"></i>
                            <input type="text" value="3" class="carrito-item-cantidad" disabled>
                            <i class="fa-solid fa-plus sumar-cantidad"></i>
                        </div>
                        <span class="carrito-item-precio">$18.000,00</span>
                    </div>
                    <button class="btn-eliminar">
                        <i class="fa-solid fa-trash"></i>
                    </button>
                </div>
                -->
            </div>
            <div class="carrito-total">
                <div class="fila">
                    <strong>Tu Total</strong>
                    <span class="carrito-precio-total">$120.000,00</span>
                </div>
                <button class="btn-pagar" id="btn-pagar">Pagar <i class="fa-solid fa-bag-shopping"></i></button>

            </div>
        </div>
    </section>
    
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

    <script src="https://kit.fontawesome.com/81581fb069.js" crossorigin="anonymous"></script>
</body>

</html>
