
<%@page import="com.cv.model.entity.Empresa"%>
<%@page import="com.cv.DAO.EmpresaDAO"%>
<%@page import="com.cv.model.entity.Usuario"%>
<%@page import="com.cv.DAO.UsuarioDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Lista Empresa</title>

        <%@include file="css-plantilla.jsp"%> 
        <%@include file="css-datatable.jsp"%>
        <%@include file="Frmmenu.jsp" %>
        <link href="css/chat.css" rel="stylesheet" type="text/css"/>

    </head>
    <body onload="startLoadingMessages()">

        <!-- Navbar -->


        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                    </div>
                </div><!-- /.container-fluid -->
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h1 class="card-title">CHAT</h1>
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <div class="main-container">
                                <div class="chat-container">
                                    <form action="chat" method="post" enctype="multipart/form-data" class="chat-form">
                                        <div class="form-group">
                                            <label for="user">Usuario:</label>
                                            <input type="text" id="user" name="user" value="<%= usu.getNombre()%>" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="message">Mensaje:</label>
                                            <input type="text" id="message" name="message" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="file">Archivo:</label>
                                            <div class="input-file-wrapper">
                                                <input type="file" id="file" name="file" class="input-file">
                                                <span class="custom-file-button">Seleccionar archivo</span>
                                            </div>
                                        </div>
                                        <button type="submit" class="send-button">Enviar</button>
                                    </form>
                                </div>

                                <div class="messages-container">
                                    <div>
                                        <h2>Mensajes</h2>
                                    </div>
                                    <div id="messages">
                                        <jsp:include page="messages.jsp" />
                                    </div>
                                </div>
                            </div>


                        </div>

                    </div>

                </div>

        </div>


        <%@include file="js-plantilla.jsp"%> 
        <%@include file="js-datatable.jsp"%> 

        <script src="js/chat.js" type="text/javascript"></script>
        
        <!-- AdminLTE for demo purposes -->
        <!-- Page specific script -->
    </body>
</html>
