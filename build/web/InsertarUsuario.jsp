<%@page import="com.cv.model.entity.TipoDocumento"%>
<%@page import="com.cv.DAO.UsuarioDAO"%>
<%@page import="com.cv.DAO.TipoDocumentoDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>AdminLTE 3 | DataTables</title>
        <%@include file="css-plantilla.jsp"%> 
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="plugins/toastr/toastr.min.css">
        <link href="dist/css/ColordeEstado.css" rel="stylesheet" type="text/css"/>





    </head>
    <body class="hold-transition sidebar-mini">
        <!-- Navbar -->
        <%@include file="Frmmenu.jsp" %>
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
            </section>
            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <!-- /.card-header --> 
                                <div class="card-body">
                                    <div class="card-header" style="color: #FFF">
                                        <h1 class="card-title">Registrar Empleados</h1>
                                    </div>
                                    <br>
                                    <!--enctype="multipart/form-data" se usa para indicar que el formulario puede contener datos binarios y 
                                    el campo input de tipo file permite seleccionar un archivo local para ser enviado al servidor.-->
                                    <form id="newusu" action="UsuarioController" method="Post" name="frm_nuevo" enctype="multipart/formData" class="needs-validation" novalidate>
                                        <div class="row">
                                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                <fieldset>
                                                    <div class="form-group">
                                                        <label for="txtNombresCliente" class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Codigo</label>
                                                        <div class="col-lg-4 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="text" name="txtCod" value="" class="border-focus-darkblue form-control" readonly="">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex">
                                                        <!-- Grupo de Formulario para Tipo de Documento -->
                                                        <div class="form-group">
                                                            <!-- Etiqueta para el Menú Desplegable -->
                                                            <label class="col-lg-12 col-md-4 col-sm-12 col-xs-12 control-label">Tipo de Doc.</label>
                                                            <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                                <!-- Menú Desplegable para la Selección de Tipo de Documento -->
                                                                <select class="border-focus-darkblue form-control" name="Txtidtipodocumento" id="Txtidtipodocumento">
                                                                    <option value="" disabled="" selected="">Seleccione</option>
                                                                    <% 
                                                                        TipoDocumentoDAO tdoc = new TipoDocumentoDAO();
                                                                        List<TipoDocumento> lista = tdoc.listarTipodocumento();
                                                                        Iterator<TipoDocumento> iterr = lista.iterator();
                                                                        TipoDocumento doc = null;
                                                                        while (iterr.hasNext()) {
                                                                            doc = iterr.next();
                                                                    %>
                                                                    <!-- Rellenar Menú Desplegable con Tipos de Documento -->
                                                                    <option value="<%=doc.getIdtipodocumento()%>"><%=doc.getTipoDocumento()%></option>
                                                                    <% } %>
                                                                </select>
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>

                                                        <!-- Grupo de Formulario para Documento de Identidad -->
                                                        <div class="form-group">
                                                            <!-- Etiqueta para el Campo de Entrada -->
                                                            <label class="col-lg-12 col-md-4 col-sm-12 col-xs-6 control-label">Documento de Identidad</label>
                                                            <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12 d-flex">
                                                                <!-- Campo de Entrada para Número de Documento -->
                                                                <input id="dni" name="dni" maxlength="8" class="border-focus-darkblue form-control mr-2">
                                                                <button type="button" id="boton" class="btn btn-success">Consultar</button>
                                                            </div>
                                                            <span id="resultado"></span>
                                                            <span id="existente"></span>
                                                            <span class="help-block"></span>
                                                            <div id="respuesta"></div>
                                                        </div> 
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Nombre y Apellidos </label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="text" id="txtNombre"name="txtNombre" class="border-focus-darkblue form-control">
                                                            <span class="help-block"></span>
                                                            <div class="invalid-feedback">
                                                                Por favor ingrese los nombres.
                                                            </div> 
                                                        </div>
                                                    </div>
                                                    <!-- commfrfrfffffffent 

                                                   
                                                    <div class="form-group">
                                                        <label class="col-lg-6 col-md-4 col-sm-12 col-xs-12 control-label">Documento de Identidad</label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="text" name="Txtdni" onkeypress="return soloNumeros(event)" maxlength="13" id="input_ruc" class="border-focus-darkblue form-control">
                                                            <span id="resultado"></span>
                                                            <span id="existente"></span>
                                                            <span class="help-block"></span>
                                                        </div>
                                                        <div id="respuesta"></div>
                                                    </div>
                                                    -->
                                                    <div class="form-group">
                                                        <label class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Direccion</label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="text" name="Txtdireccion" id="Txtdireccion" class="border-focus-darkblue form-control">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Sueldo</label>
                                                        <div class="col-lg-4 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="text" name="Txtsueldo" onkeypress="return soloNumeros(event)" id="Txtsueldo" class="border-focus-darkblue form-control">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                            </div>
                                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                <fieldset>
                                                    <div class="form-group">
                                                        <% Date dNow = new Date();
                                                            SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
                                                            String currentDate = ft.format(dNow);
                                                        %>
                                                        <label class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Fecha de Registro</label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="text" name="Txtfechaderegistro" value="<%=currentDate%>" class="border-focus-darkblue form-control" readonly="">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Email</label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="email" name="Txtemail" class="border-focus-darkblue form-control">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Telefono</label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="text" maxlength="9" name="Txttelefono" class="border-focus-darkblue form-control">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Rol</label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                            <select class="form-control select2" name="txtrol">
                                                                <option selected="selected">--</option>
                                                                <option>Administrador</option>
                                                                <option>Almacen</option>
                                                                <option>Compra</option>
                                                            </select>
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>

                                                    <div class="d-flex">
                                                        <div class="form-group">
                                                            <label class="col-lg-6 col-md-4 col-sm-12 col-xs-6 control-label">Usuario</label>
                                                            <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                                <input type="text" name="txtusu" class="border-focus-darkblue form-control">
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-lg-8 col-md-4 col-sm-12 col-xs-6 control-label">Contraseña</label>
                                                            <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                                <input type="text" name="txtpassword" class="border-focus-darkblue form-control">
                                                                <span class="help-block"></span>
                                                            </div>
                                                        </div> 
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Foto</label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="file" name="file1" class="border-focus-darkblue form-control">
                                                            <span class="help-block"></span>
                                                        </div>

                                                    </div>
                                                </fieldset>
                                            </div>
                                        </div>
                                        <div class="modal-footer"> 
                                            <center>
                                                <a class="btn btn-app bg-secondary" href="Usuario.jsp"><i class="fa fa-window-close"></i>CANCELAR</a>
                                                <button type="submit" name="accion" class="btn btn-app bg-cyan"><i class="fas fa-check-square"></i>GRABAR</button>
                                            </center>
                                        </div>
                                    </form>

                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                        </div>
                        <!-- /.col -->
                    </div>
                </div>                                         
                <!-- /.row -->

                <!-- /.container-fluid -->
            </section>
            <!-- /.content -->
        </div>
        <%@include file="js-plantilla.jsp"%> 
        <script src="plugins/toastr/toastr.min.js"></script>
        <script src="Validacionysweetalert/consultaDNI.js" type="text/javascript"></script>
        <script src="Validacionysweetalert/Usuario.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

        <script type="text/javascript">
                                                                $(document).ready(function () {
//Validando si existe la Cedula en BD antes de enviar el Form
                                                                    $("#cedula").on("keyup", function () {
                                                                        var cedula = $("#cedula").val(); //CAPTURANDO EL VALOR DE INPUT CON ID CEDULA
//Valido la longitud 
                                                                        var dataString = 'cedula=' + cedula;
                                                                        $.ajax({
                                                                            url: 'ValidarRuc',
                                                                            type: "GET",
                                                                            data: dataString,
                                                                            dataType: "JSON",
                                                                            success: function (datos) {
                                                                                if (datos.success == true) {
                                                                                    $("#respuesta").html(datos.message);
                                                                                } else {
                                                                                    $("#respuesta").html(datos.message);
                                                                                }
                                                                            }
                                                                        });
                                                                    });
                                                                });

        </script>
    </body>
</html>