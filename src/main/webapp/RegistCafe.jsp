<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>Registro de Cafetín</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

</head>

<body>
<div class="container-sm">

    <br>
    <br>
    <h2>Registrar un Cafetín</h2>
    <br>
    <br>
    <div class="container-md">
        <form action="RegistroCafetines2" method="POST">
            <label for="nombre">Nombre del Cafetín:</label><br>
            <input type="text" id="nombre" name="nombre" class="form-control"><br>
            <label for="direccion">Dirección del Cafetín:</label><br>
            <input type="text" id="direccion" name="direccion" class="form-control"><br>
            <h3>Menú:</h3>
            <br>
            <div id="menu">0
                <!-- Div inicial vacío para agregar productos dinámicamente -->
            </div>
            <br>
            <!--button type="button" class="btn btn-primary" onclick="agregarProducto()">Agregar Producto</button>
            <button type="reset" value="reset" class="btn btn-secondary">Borrar</button-->
            <br>
            <br>
            <button type="submit" value="Registrar" class="btn btn-success">Registrar</button>
            <br>
            <br>
            <br>
            <a class="btn btn-success" href="welcome.jsp">Regresar</a>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="registroCafe.js"></script>

</body>

</html>