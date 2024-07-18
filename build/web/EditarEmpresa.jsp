<%@page import="com.cv.model.entity.Empresa"%>
<%@page import="com.cv.DAO.EmpresaDAO"%>
<%@page import="com.cv.DAO.UsuarioDAO"%>
<%@page import="com.cv.model.entity.Auxiliar"%>
<%@page import="java.util.List"%>
<%@page import="com.cv.model.entity.Usuario"%>
<%@page import="com.cv.model.entity.TipoDocumento"%>
<%@page import="com.cv.DAO.TipoDocumentoDAO"%>
<%@page import="com.cv.model.entity.Auxiliar"%>
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
        <title>Lista</title>
        <%@include file="css-plantilla.jsp"%> 
        <link rel="stylesheet" href="plugins/toastr/toastr.min.css">
        <style>
            legend {
                display: block;
                width: 100%;
                padding: 0;
                margin-bottom: 25px;
                font-size: 21px;
                line-height: inherit;
                color: #333;
                border: 0;
                border-bottom: 1px solid #D4D4D4;
            }
            .col-sm-12, .col-md-12, .col-lg-12 {
                position: relative;
                min-height: 1px;
                padding-left: 25px;
                padding-right: 25px;
            }
            .form-horizontal .form-group {
                margin-left: 0!important;
                margin-right: 0!important;
            }
            .form-control {
                color: #000;
                height: 30px;
                padding: 0 12px;
                box-shadow: none !important;
                border-width: 2px;
                letter-spacing: 0.5px;
                border-radius: 0 !important;
            }
            .form-control {
                display: block;
                width: 100%;
                height: 38px;
                padding: 6px 12px;
                font-size: 16px;
                line-height: 1.78571;
                color: #000;
                background-color: #fff;
                background-image: none;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%);
                transition: border-color ease-in-out 0.15s,box-shadow ease-in-out 0.15s;
            }
        </style>
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
                    <%                         EmpresaDAO dao = new EmpresaDAO();
                        int id = Integer.parseInt((String) request.getAttribute("idemp"));
                        Empresa u = (Empresa) dao.list(id);
                    %>
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <!-- /.card-header --> 
                                <div class="card-body">

                                    <div class="card-header" style="color: #FFF">
                                        <h1 class="card-title">Editar Empresa</h1>
                                    </div>
                                    <br>
                                    <form id="editemp" method="post" action="EmpresaController" name="frm_edit" enctype="multipart/form-data"> 

                                        <div class="row">
                                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                <fieldset>

                                                    <div class="form-group">
                                                        <input class="form-control" type="hidden"  name="txtid" value="<%=u.getId()%>" required="">
                                                        <div class="form-group">
                                                            <label>Nombre</label>
                                                            <input class="form-control" type="text"  name="Txtnombre" value="<%=u.getNombre()%>" required="">
                                                        </div> 
                                                        <div class="form-group"> 
                                                            <label >Ruc</label> 
                                                            <input class="form-control" type="text"  name="TxtNro" value="<%=u.getNro()%>" required="">
                                                        </div>
                                                    </div>
                                                </fieldset>
                                            </div>
                                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                <div class="form-group"> 
                                                    <label >Direccion</label> 
                                                    <input class="form-control" type="text"  name="Txtdireccion" value="<%=u.getDireccion()%>" required="">
                                                </div>
                                                <div class="form-group"> 
                                                    <label >Direccion Anexo</label> 
                                                    <input class="form-control" type="text"  name="Txtubigeo" value="<%=u.getUbigeo()%>" required="">
                                                </div>

                                            </div>
                                                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                <div class="form-group"> 
                                                    <label >Eslogan</label> 
                                                    <input class="form-control" type="text"  name="Txtadicional" value="<%=u.getAdicional()%>" required="">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-10 col-md-4 col-sm-12 col-xs-12 control-label">Imagen Actual</label>
                                                <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                    <input type="radio" name="selected" value="SelectImagenActual" id="SelectImagenActual" checked="checked"> 
                                                    <image src="<%=u.getFilename1()%>" width="200" height="200"/>
                                                    <input type="hidden"  name="txtImagen" id="txtImagen" value="<%=u.getFilename1()%>"  class="border-focus-darkblue form-control">
                                                    <span class="help-block"></span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-10 col-md-4 col-sm-12 col-xs-12 control-label">Modificar imagen</label>
                                                <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                    <dd> <input type="radio" name="selected" value="SelectModificarImagen" id="SelectModificarImagen"> 
                                                        <input type="file"  name="txtModificarImagen" id="txtModificarImagen" class="border-focus-darkblue form-control">
                                                        <span class="help-block"></span>
                                                </div>
                                            </div>
                                            
                                        </div>
                                        <div class="modal-footer">
                                            <a href="Empresa.jsp" class="btn btn-default" >Cancelar</a> 
                                            <input  class="btn btn-success" type="submit" name="accion" value="Actualizar">
                                            <!--<input id="btnguardar" type="submit" class="btn btn-success" name="accion" value="add">-->
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
        <script src="Validacionysweetalert/Empresa.js" type="text/javascript"></script>
    </body>
</html>
