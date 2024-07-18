
<%@ page import="com.cv.DAO.EmpresaDAO, com.cv.DAO.UsuarioDAO, com.cv   .model.entity.Usuario" %>
<%
    HttpSession sesion = request.getSession();
    String tipo = (String) sesion.getAttribute("tipo");
    if (tipo == null || !(tipo.equalsIgnoreCase("Administrador") || tipo.equalsIgnoreCase("Compra") || tipo.equalsIgnoreCase("Almacen") || tipo.equalsIgnoreCase("Venta"))) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%
    String codigo = (String) sesion.getAttribute("usuario");
    Usuario usu = UsuarioDAO.listimg(codigo);
%>
<!-- Incluir custom.css en el head -->
<head>

    <link href="css/custom.css" rel="stylesheet" type="text/css"/>
    <style>
        .navbar-custom {
            background-color: #28a745; /* Verde Bootstrap */
        }
        .navbar-custom .nav-link,
        .navbar-custom .navbar-brand {
            color: #fff; /* Color del texto blanco */
        }
        .navbar-custom .nav-link:hover {
            color: #c3e6cb; /* Color del texto al pasar el ratón */
        }
    </style>
</head>


<!-- Navbar -->
<div class="main-header navbar navbar-expand navbar-custom">
    <!-- Enlaces a la izquierda de la barra de navegación -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>
    </ul>
    <!-- Enlaces a la derecha de la barra de navegación -->
    <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                <i class="fas fa-expand-arrows-alt"></i>
            </a>
        </li>
        <li class="nav-item btn-exit">
            <a class="nav-link" data-slide="true" role="button">
                <i class="fa fa-power-off" aria-hidden="true" title="Salir" id="btn-exi"></i>
            </a>
        </li>
    </ul>
</div>
<!-- Main Sidebar Container -->

<section class="main-sidebar sidebar-dark-green elevation-4 sidebar-green">
    <a href="#" class="brand-link">
        <img src="<%=EmpresaDAO.img()%>" width="235" height="140"> 
        <%-- <img src="img/campo.jpg" width="230" height="120">--%>
    </a>
    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="<%= usu.getFilename1()%>" class="img-circle elevation-5" alt="User Image"> 
            </div>
            <div class="info">
                <a href="#" class="d-block"><%= usu.getNombre()%></a>
            </div>
        </div>
        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <% if ("Administrador".equalsIgnoreCase(tipo)) { %>
                <li class="nav-item">
                    <a href="DashboardAlmacen.jsp" class="nav-link">
                        <img src="img/inicio_1.png" alt="Profile Icon">
                        <p> INICIO<i class="fas fa-angle-left right"></i></p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <img src="img/registro.png" alt="Profile Icon">
                        <p>GESTION REGISTROS<i class="fas fa-angle-left right"></i></p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item"><a href="Empresa.jsp" class="nav-link"><i class="far fas fa-circle nav-icon"></i><p>Empresa</p></a></li>
                        <li class="nav-item"><a href="Usuario.jsp" class="nav-link"><i class="far fas fa-circle nav-icon"></i><p>Empleado</p></a></li>
                        <li class="nav-item"><a href="Producto.jsp" class="nav-link"><i class="far fas fa-circle nav-icon"></i><p>Producto</p></a></li>
                        <li class="nav-item"><a href="Cliente.jsp" class="nav-link"><i class="far fas fa-circle nav-icon"></i><p>Cliente</p></a></li>
                        <li class="nav-item"><a href="Proveedor.jsp" class="nav-link"><i class="far fas fa-circle nav-icon"></i><p>Proveedor</p></a></li>
                    </ul>
                </li>
                <% } %>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <img src="img/ajustes.png" alt="Profile Icon">
                        <p>AJUSTES<i class="right fas fa-angle-left"></i></p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item"><a href="Clasificacion.jsp" class="nav-link"><i class="far fas fa-circle nav-icon"></i><p>Clasificación</p></a></li>
                        <li class="nav-item"><a href="Categoria.jsp" class="nav-link"><i class="far fas fa-circle nav-icon"></i><p>Categoría</p></a></li>
                        <li class="nav-item"><a href="Subcategoria.jsp" class="nav-link"><i class="far fas fa-circle nav-icon"></i><p>Subcategoria</p></a></li>
                        <li class="nav-item"><a href="Unidadmedida.jsp" class="nav-link"><i class="far fas fa-circle nav-icon"></i><p>Unidad de Medida</p></a></li>
                        <li class="nav-item"><a href="Stockminimoymaximo.jsp" class="nav-link"><i class="far fas fa-circle nav-icon"></i><p>Stock mínimo y máximo</p></a></li>
                        <li class="nav-item"><a href="Motivo.jsp" class="nav-link"><i class="far fas fa-circle nav-icon"></i><p>Motivo</p></a></li>
                        <li class="nav-item"><a href="Transporte.jsp" class="nav-link"><i class="far fas fa-circle nav-icon"></i><p>Transporte</p></a></li>
                        <li class="nav-item"><a href="Vehiculo.jsp" class="nav-link"><i class="far fas fa-circle nav-icon"></i><p>Vehículo</p></a></li>
                        <li class="nav-item"><a href="Conductor.jsp" class="nav-link"><i class="far fas fa-circle nav-icon"></i><p>Conductor</p></a></li>
                    </ul>
                </li>
                <% if ("Administrador".equalsIgnoreCase(tipo) || "Almacen".equalsIgnoreCase(tipo)) { %>

                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <img src="img/store.png" alt="Profile Icon">
                        <p>ALMACEN<i class="right fas fa-angle-left"></i></p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item"><a href="ListarNotaingreso.jsp" class="nav-link"><i class="far fas fa-circle nav-icon"></i><p>Nota de Ingreso</p></a></li>
                        <li class="nav-item"><a href="ListarNotasalida.jsp" class="nav-link"><i class="far fas fa-circle nav-icon"></i><p>Nota Salida</p></a></li>
                        <li class="nav-item"><a href="ListarGuiaremisioncliente.jsp" class="nav-link"><i class="far fas fa-circle nav-icon"></i><p>Guía de remisión</p></a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <img src="img/report.png" alt="Profile Icon">
                        <p>REPORTES<i class="fas fa-angle-left right"></i></p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item"><a href="ReporteIngreso.jsp" class="nav-link"><i class="far fa-dot-circle nav-icon"></i><p>Registro de Ingreso</p></a></li>
                        <li class="nav-item"><a href="Reportesalida.jsp" class="nav-link"><i class="far fa-dot-circle nav-icon"></i><p>Registro de Salida</p></a></li>
                        <li class="nav-item"><a href="ReporteStockproducto.jsp" class="nav-link"><i class="far fa-dot-circle nav-icon"></i><p>Stock Producto</p></a></li>
                        <%-- <li class="nav-item"><a href="ReporteStockminimo.jsp" class="nav-link"><i class="far fa-dot-circle nav-icon"></i><p>Stock Mínimo</p></a></li>--%>
                        <%--  <li class="nav-item"><a href="ReporteStockmaximo.jsp" class="nav-link"><i class="far fa-dot-circle nav-icon"></i><p>Stock Máximo</p></a></li>--%>
                        <li class="nav-item"><a href="Listaproductoconsultamovimiento.jsp" class="nav-link"><i class="far fa-dot-circle nav-icon"></i><p>Movi. Por Producto</p></a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <img src="img/chat.png" alt="Profile Icon">
                        <p>CHATS<i class="fas fa-angle-left right"></i></p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item"><a href="chat2.jsp" class="nav-link"><i class="far fa-dot-circle nav-icon"></i><p>Mensajes</p></a></li>
                    </ul>
                </li>
                <% }%>
            </ul>
        </nav>
    </div>
</section>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

