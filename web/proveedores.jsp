<%-- 
    Document   : proveedores
    Created on : 26 may 2024, 22:43:27
    Author     : Lumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.DAOListadoProveedor"%>
<%@page import="modelo.proveedor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Proveedores</title>
        <link href="css/ValiForms.css" rel="stylesheet" type="text/css"/>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    </head>
    <body>
        <div class="container">
            <h1>Registro de Proveedores</h1><br>

            <form action="RegistrarProveedor" method="post" class="row g-3 needs-validation" novalidate>


                <div class="row">
                    <div class="col-sm-4">
                        <label for="razon_social" class="form-label">Razón Social:</label>
                        <input type="text" name="razon_social" id="razon_social" class="form-control" placeholder="" required>
                        <div class="invalid-feedback">
                            Imcompleto
                        </div> 
                    </div>
                    <div class="col-sm-4">
                        <label for="ruc" class="form-label">RUC:</label>
                        <input type="text" class="form-control" id="ruc" name="ruc"placeholder="" required>
                        <div class="invalid-feedback">
                            Imcompleto
                        </div> 
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-4">
                        <label for="telefono" class="form-label">Telefono:</label>
                        <input type="text" class="form-control" id="telefono" name="telefono" placeholder="" required>
                        <div class="invalid-feedback">
                            Imcompleto
                        </div> 
                    </div>
                    <div class="col-sm-4">
                        <label for="correo" class="form-label">Correo electronico:</label>
                        <input type="email" class="form-control" name="correo" id="correo" placeholder="" required>
                        <div class="invalid-feedback">
                            Imcompleto
                        </div> 
                    </div>
                     <div class="col-sm-4">
                        <label for="servicio" class="form-label">Servicio:</label>
                        <input type="text" class="form-control" id="servicio" name="servicio" placeholder="" required>
                        <div class="invalid-feedback">
                            Imcompleto
                        </div> 
                    </div>
                </div>               
                <div class="col-sm-12">
                    <button type="submit" class="btn btn-primary" value="Registrar"><img src="img/add.png" alt="Profile Icon">
                        Nuevo Registro
                    </button>
                </div>

            </form>
            <br>
        </div>
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <div class="card-header text-center">
                        <h3>Listar Proveedor</h3>
                    </div>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col"class="text-center">RAZON SOCIAL</th>
                                <th scope="col"class="text-center">RUC</th>
                                <th scope="col"class="text-center">TELEFONO</th>
                                <th scope="col"class="text-center">CORREO</th>
                                <th scope="col" class="text-center">SERVICIO</th>
                                <th scope="col" class="text-center">ACCIONES</th>
                            </tr>
                        </thead>

                        <%
                            DAOListadoProveedor dao = new DAOListadoProveedor();
                            ArrayList<proveedor> list = dao.ListaProveedor();
                            Iterator<proveedor> iter = list.iterator();
                        %>

                        <%                       
                                while (iter.hasNext()) {
                                proveedor pro = iter.next();
                        %>
                        <tbody>

                            <tr>
                                <td class="text-center"><%=pro.getProvid()%></td>
                                <td class=""><%=pro.getRazonsocial()%></td>
                                <td class=""><%=pro.getRuc()%></td>
                                <td class="text-center"><%=pro.getTelefono()%></td>
                                <td class="text-center"><%=pro.getCorreo()%></td>
                                <td class="text-center"><%=pro.getServicio()%></td>
                                <td class="text-center">
                                    <a class="btn btn-warning" href=""><img src="img/modify.png" alt="Profile Icon"></a>
                                    <a class="btn btn-danger" href="javascript:void(0);" onclick="confirmDelete(<%=pro.getProvid()%>);"><img src="img/delete.png" alt="Profile Icon"></a>
                                </td>
                            </tr>      
                            <%
                                }
                            %>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script src="js/ValiForms.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <script type="text/javascript">
                                        function confirmDelete(id) {
                                            Swal.fire({
                                                title: '¿Estás seguro?',
                                                text: "¡No podrás revertir esto!",
                                                icon: 'warning',
                                                showCancelButton: true,
                                                confirmButtonColor: '#3085d6',
                                                cancelButtonColor: '#d33',
                                                confirmButtonText: 'Sí, eliminar',
                                                cancelButtonText: 'Cancelar'
                                            }).then((result) => {
                                                if (result.isConfirmed) {
                                                    window.location.href = "EliminarProveedorServlet1?id=" + id;
                                                }
                                            });
                                        }
        </script>
    </body>

</html>
