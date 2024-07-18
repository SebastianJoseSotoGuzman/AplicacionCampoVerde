<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
    <div class="main-container">
        <div class="image-container">
            <img src="img/inicio.png" alt="Side Image" class="side-image">
        </div>
        <div class="login-container">
            <div class="login-box">
                <h1>Agropecuaria</h1>
                <h1>Campo Verde</h1>
                <img src="img/campo.jpg" alt="Logo" class="logo">
                <h2>Iniciar Sesión</h2>
                <form action="LoginController" method="post">
                    <div class="input-group">
                        <input name="txtUsuario" class="form-control" type="text" id="userName" required>
                        <label for="userName">Usuario</label>
                    </div>
                    <div class="input-group">
                        <input name="txtPassword" class="form-control" type="password" id="pass" required>
                        <label for="pass">Contraseña</label>
                    </div>
                    <button type="submit" name="btnEntrar" id="SingIn" class="button">Ingresar</button>
                </form>
            </div>
        </div>
    </div>
    <script src="plugins/jquery/jquery.min.js"></script>
    <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="dist/js/adminlte.min.js"></script>
    <%
        HttpSession sesion = request.getSession();
        String tipo = "";
        if (request.getAttribute("tipo") != null) {
            tipo = request.getAttribute("tipo").toString();
            if (tipo.equalsIgnoreCase("Administrador")) {
                sesion.setAttribute("usuario", request.getAttribute("usuario"));
                sesion.setAttribute("tipo", tipo);
                response.sendRedirect("DashboardAlmacen.jsp");
            } else if (tipo.equalsIgnoreCase("Almacen")) {
                sesion.setAttribute("usuario", request.getAttribute("usuario"));
                sesion.setAttribute("tipo", tipo);
                response.sendRedirect("DashboardAlmacen.jsp");
            } else if (tipo.equalsIgnoreCase("Compra")) {
                sesion.setAttribute("usuario", request.getAttribute("usuario"));
                sesion.setAttribute("tipo", tipo);
                response.sendRedirect("Proveedor.jsp");
            } else if (tipo.equalsIgnoreCase("Venta")) {
                sesion.setAttribute("usuario", request.getAttribute("usuario"));
                sesion.setAttribute("tipo", tipo);
                response.sendRedirect("ListarFacturaventa.jsp");
            }
        }

        if (request.getParameter("cerrar") != null) {
            session.invalidate();
        }
    %>
</body>
</html>
