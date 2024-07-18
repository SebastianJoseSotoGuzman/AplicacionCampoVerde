
<%@page import="com.cv.model.entity.Categoria"%>
<%@page import="com.cv.DAO.CategoriaDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Lista de Categoria</title>

        <%@include file="css-plantilla.jsp"%> 
        <%@include file="css-datatable.jsp"%>
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
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h3>Administrar Categoria</h3>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <a href="#addCategoria" class="bluefacturactivaFocus js-customer-action-add btn-primary btn btn-default"  data-toggle="modal"><i class="fas fa-folder-plus"></i> &nbsp; AGREGAR</a>
                            </ol>
                        </div>
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
                                    <h2 class="card-title">LISTA DE CATEGORIA</h2>
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <table id="example"  class="table table-striped table-bordered second" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th style="display:none;">codigo</th>
                                                <th>Código</th>
                                                <th>Nombre</th>
                                                <th style="text-align: center">Estado</th>
                                                <th style="text-align: center">Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%   CategoriaDAO dao = new CategoriaDAO();
                                                List<Categoria> list = dao.ListadoCategoria();
                                                Iterator<Categoria> iter = list.iterator();
                                                Categoria per = null;
                                                while (iter.hasNext()) {
                                                    per = iter.next();
                                            %>
                                            <tr>
                                                <td style="display:none;" id="idcat"><%=per.getIdcategoria()%></td>
                                                <td><%= per.getCodigo()%></td>
                                                <td><%= per.getNombre()%></td>
                                                <% String Estado = CategoriaDAO.getCategoriaEstado(per.getIdcategoria());

                                                    if (Estado.equalsIgnoreCase("Activo")) {%>
                                                <td style="text-align: center"><markactivo><%= Estado%></markactivo></td>   
                                                <%   } else {%>
                                        <td style="text-align: center"><markdesactivado><%= Estado%></markdesactivado></td>    
                                            <%     }
                                            %> 
                                        <td style="text-align: center">
                                            <a class="btn btn-warning editbtn" data-toggle="modal" data-target="#editar"><i data-toggle="tooltip" title="Editar"><img src="img/modify.png"></i></a>
                                            
                                            <a id='btn-estado' class="btn btn-success" class="edit"><i data-toggle="tooltip" title="Estado"><img src="img/estado.png" alt="Profile Icon"></i></a>
                                            <a id='btn-eliminar' class="btn btn-danger" class="edit"><i data-toggle="tooltip" title="Eliminar"><img src="img/delete.png" alt="Profile Icon"></i></a>
                                        </td>
                                        </tr>
                                        <%}%>
                                        </tbody>

                                    </table>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->


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

        <!-- add Modal HTML -->
        <div id="addCategoria" class="modal fade" >
            <div class="modal-dialog" role="document" style="z-index: 9999; width: 450px">
                <div class="modal-content">
                    <form id="newcategoria" action="CategoriaController" method="Post" name="frm_nuevo">
                        <div class="modal-header">      
                            <h4 class="modal-title">Agregar Clasificación</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">  
                            <%
                                CategoriaDAO com = new CategoriaDAO();
                                String numserie = com.Numserie();
                            %>
                            <div class="form-group">
                                <label>Código</label>
                                <input type="text" name="txtCod" value="<%=numserie%>"  class="form-control" readonly="" >
                            </div>
                            <div class="form-group">
                                <label>Nombre</label>
                                <input type="text" name="txtNom" class="form-control" placeholder="Nombre">
                            </div>  
                        </div>
                        <div class="modal-footer">
                            <input type="button"  class="btn btn-danger" data-dismiss="modal" value="Cancelar">
                            <input onclick="return validarcategoria()"  class="btn btn-success" type="submit" name="accion" value="Agregar">
                        </div>
                    </form>
                </div>
            </div>
        </div> 
        <!--Formulario de Modificar-->
        <div id="editar" class="modal fade" >
            <div class="modal-dialog" role="document" style="z-index: 9999; width: 450px">
                <div class="modal-content">
                    <form id="editcategoria"  method="post" action="CategoriaController" name="frm_edit"> 
                        <div class="modal-body">  
                            <div class="form-group">
                                <input  type="hidden" type="text"  name="txtid" id="id" readonly="">
                            </div> 
                            <div class="form-group">
                                <label>Código</label>
                                <input type="text" class="form-control"  name="TxtCod" id="cod" readonly="">
                            </div> 
                            <div class="form-group">
                                <label>Nombre</label>
                                <input type="text" class="form-control" name="Txtnombre" id="nombre">
                            </div>  
                        </div>
                        <div class="modal-footer">-
                            <a href="Categoria.jsp" class="btn btn-danger" >Cancelar</a> 
                            <input onclick="return valeditarcategoria()" class="btn btn-success" type="submit" name="accion" value="Actualizar">
                        </div>
                    </form>
                </div>
            </div>
        </div> 
        <!-- ./wrapper -->
        <%@include file="js-plantilla.jsp"%> 
        <%@include file="js-datatable.jsp"%> 
        <script src="plugins/toastr/toastr.min.js"></script>
        <script src="Validacionysweetalert/Categoria.js" type="text/javascript"></script>
        <script >
                                $('.editbtn').on('click', function () {
                                    $tr = $(this).closest('tr');
                                    var datos = $tr.children('td').map(function () {
                                        return $(this).text();
                                    });
                                    $('#id').val(datos[0]);
                                    $('#cod').val(datos[1]);
                                    $('#nombre').val(datos[2]);

                                })
        </script>


        <script>
            function confirmarEliminacion(idCategoria) {
                // Mostrar una confirmación al usuario
                var confirmacion = confirm("¿Estás seguro de eliminar esta categoría?");

                // Si el usuario confirma, realizar la acción
                if (confirmacion) {
                    // Redirigir a la URL del servlet para eliminar
                    window.location.href = "CategoriaController?accion=Estado&id=" + idCategoria;

                    // Eliminar la fila correspondiente después de cierto tiempo (por ejemplo, 2 segundos)
                    setTimeout(function () {
                        // Encontrar la fila por el ID y removerla
                        var filaAEliminar = document.getElementById("fila_" + idCategoria);
                        if (filaAEliminar) {
                            filaAEliminar.remove();
                            parent.location.href = "Clasificacion.jsp";// Reemplaza con la URL correcta de tu vista de lista
                        }

                        // Redirigir a la lista después de eliminar la fila

                    }, 1000); // 2000 milisegundos (2 segundos) de espera antes de redirigir
                }

            }
        </script>
        <script>
            function cambiarStatusRegistro(idCategoria) {
                $.ajax({
                    type: 'POST',
                    url: "CategoriaController?accion=Estado&id=" + idCategoria; ,
                    data: idCategoria,
                    success: function (response) {
                        if (response === "ok") {
                            swal({
                                title: "Correcto",
                                text: "Estado actualizado",
                                type: "success",
                                confirmButtonClass: "btn-success",
                                confirmButtonText: "OK"
                            }, function () {
                                // Redirige a registroSanitario.jsp después de hacer clic en "OK"
                                window.location.href = "Categoria.jsp";
                            });
                        } else {
                            swal("Error", "Error al actualizar el estado", "error");
                        }
                    },
                    error: function () {
                        swal("Error", "Error de sistema, inténtelo más tarde", "error");
                    }
                });
            }

        </script>
        <!-- AdminLTE for demo purposes -->
        <!-- Page specific script -->

    </body>
</html>
