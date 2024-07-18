<%-- 
    Document   : proveedores
    Created on : 26 may 2024, 22:43:27
    Author     : Lumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Productos</title>
        <link href="css/ValiForms.css" rel="stylesheet" type="text/css"/>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <h1>Registro de Productos</h1><br>
            <form action="RegistrarProducto" method="post" class="needs-validation" novalidate>
                <div class="row">
                    <div class="col-sm-4">
                        <label for="nombre" class="form-label">Nombre:</label>
                        <input type="text" name="nombre" id="nombre" class="form-control" placeholder="" required>
                        <div class="invalid-feedback">
                            Imcompleto
                        </div> 
                    </div>
                    <div class="col-sm-4">
                        <label for="tipo" class="form-label">Tipo Producto:</label>
                        <select class="form-select" id="tipo" name="tipo" required="">
                            <option selected disabled value="">Seleccione...</option>
                            <option >Ganadero</option>
                            <option >Agricola</option>

                        </select>
                        <div class="invalid-feedback">
                            Por favor seleccione.
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <label for="precio" class="form-label">Precio:</label>
                        <input type="number" class="form-control" id="precio" name="precio" placeholder="" required>
                        <div class="invalid-feedback">
                            Incompleto
                        </div> 
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <label for="unidad_medida" class="form-label">Unidad Medida:</label>
                        <input type="text" class="form-control" id="unidad_medida" name="unidad_medida" placeholder="" required>
                        <div class="invalid-feedback">
                            Incompleto
                        </div> 
                    </div>
                    <div class="col-sm-4">
                        <label for="stock" class="form-label">Stock:</label>
                        <input type="text" class="form-control" id="stock" name="stock" placeholder="" required>
                        <div class="invalid-feedback">
                            Incompleto
                        </div> 
                    </div>
                </div>  
                <div class="row">
                    <div class="col-sm-8">
                        <label for="validationTextarea" class="form-label">Descripcion del Producto:</label>
                        <textarea class="form-control" id="validationTextarea" placeholder="" rows="4"required></textarea>
                        <div class="invalid-feedback">
                            Falta la Descripcion del Producto.
                        </div>
                    </div>

                </div>    

                <br>
                <div class="col-sm-12">
                    <button type="button" class="btn btn-success" onclick="return limpiar();">
                        Nuevo
                    </button>
                    <button type="submit" class="btn btn-primary" value="Registrar">
                        Registrar
                    </button>
                    <button type="submit" class="btn btn-warning">
                        Modificar
                    </button>
                    <button type="button" class="btn btn-danger">
                        Eliminar
                    </button> 
                </div>

            </form>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script src="js/ValiForms.js" type="text/javascript"></script>
    </body>

</html>
