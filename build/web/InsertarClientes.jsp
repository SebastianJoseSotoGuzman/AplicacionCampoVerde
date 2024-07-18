<%@page import="com.cv.model.entity.TipoDocumento"%>
<%@page import="com.cv.DAO.TipoDocumentoDAO"%>
<%@page import="com.cv.DAO.AuxiliarDAO"%>
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
                                        <h1>Registrar Cliente</h1>
                                    </div>
                                    <br>
                                    <form id="newcliente" action="ClienteController" method="Post" name="frm_nuevo">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                <fieldset>
                                                    <legend>Datos Personales
                                                    </legend>
                                                    <% AuxiliarDAO clie = new AuxiliarDAO();
                                                        String numserie = clie.Numseriecliente();
                                                    %>
                                                    <div class="form-group">
                                                        <label for="txtNombresCliente" class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Código</label>
                                                        <div class="col-lg-4 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="text" name="txtCod" value="<%=numserie%>" class="border-focus-darkblue form-control" readonly="">
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
                                                                <input id="txtdoc" name="txtdoc" maxlength="11" class="border-focus-darkblue form-control mr-2">
                                                                <button type="button" id="boton" class="btn btn-success">Consultar</button>
                                                            </div>
                                                            <span id="resultado"></span>
                                                            <span id="existente"></span>
                                                            <span class="help-block"></span>
                                                            <div id="respuesta"></div>
                                                        </div> 
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Nombre / Razón Social</label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="text" id="Txtacliente" name="Txtacliente" class="border-focus-darkblue form-control">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Dirección</label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="text" id="Txtdireccion" name="Txtdireccion" id="Txtdireccion" class="border-focus-darkblue form-control">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Correo</label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="email" name="Txtcorreo" id="Txtcorreo" class="border-focus-darkblue form-control">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                            </div>
                                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                <fieldset>
                                                    <legend>Información de contacto</legend>
                                                    <div class="form-group">
                                                        <% Date dNow = new Date();
                                                            SimpleDateFormat ft
                                                                    = new SimpleDateFormat("yyyy-MM-dd");
                                                            String currentDate = ft.format(dNow);
                                                        %>
                                                        <label class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Fecha de Registro</label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="text" name="Txtfechaderegistro" value="<%=currentDate%>" class="border-focus-darkblue form-control" readonly="">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Contacto</label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="text" name="Txtcontacto" class="border-focus-darkblue form-control">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Teléfono</label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="text" name="Txttelefono" class="border-focus-darkblue form-control">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Celular</label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="text" name="Txtcelular"  id="Txtcelular" class="border-focus-darkblue form-control">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="Txtsexo" class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Género</label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12" class="border-focus-darkblue form-control">
                                                            <input type="radio" name="Txtsexo" value="M" >&nbsp; M
                                                            <input type="radio" name="Txtsexo" value="F" >&nbsp; F
                                                        </div>
                                                        <span class="help-block"></span>
                                                    </div>
                                                </fieldset>
                                            </div>


                                        </div>
                                        <div class="modal-footer"> 
                                            <center>
                                                <a class="btn btn-app bg-secondary" href="Cliente.jsp"><i class="fa fa-window-close"></i> CANCELAR</a>
                                                <button onclick="return validarnewcliente()" type="submit" name="accion" class="btn btn-app bg-cyan" ><i class="fas fa-check-square"></i> GRABAR</button>
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
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </section>
            <!-- /.content -->
        </div>
        <%@include file="js-plantilla.jsp"%> 
        <script src="plugins/toastr/toastr.min.js"></script>
        <script src="Validacionysweetalert/Cliente.js" type="text/javascript"></script>
        <script src="Validacionysweetalert/consultarRUC.js" type="text/javascript"></script>
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
