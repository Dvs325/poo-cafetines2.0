<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 14/05/2024
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Agregar Nuevo Usuario</title>

    <style>
        body {
            background-color: aqua;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: "Arial Black", sans-serif;
        }
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form {
            background-color: cadetblue;
            padding: 20px;
            border-radius: 5px;
            color: white;
        }
        .form h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form input[type="text"],
        .form input[type="password"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 10px;
            border: none;
            border-radius: 5px;
        }
        .form input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #004466;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .form input[type="submit"]:hover {
            background-color: #003355;
        }
        .error {
            color: red;
            text-align: center;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="form">
        <h2>Ingresar</h2>
        <form action="AgregarUsuario" method="post">
            <label for="nombres">Nombres del usuario:</label>
            <input type="text" id="nombres" name="nombres" required><br>

            <label for="apellidos">Apellidos del usuario:</label>
            <input type="text" id="apellidos" name="apellidos" required><br>

            <label for="carnet">Carnet del usuario:</label>
            <input type="text" id="carnet" name="carnet" required><br>

            <label for="cargo">Cargo del usuario:</label>
            <!--input type="text" id="carnet" name="carnet" required><br-->
            <select name="cargo" id="cargo">
                <option value="estudiante">Estudiante</option>
                <option value="profesor">Profesor</option>
                <option value="p.administrativo">Personal Administrativo</option>
            </select>
            <br>
            <br>

            <label for="contraseña">Contraseña nueva</label>
            <input type="text" name="contraseña" id="contraseña" required>



            <input type="submit" value="agregar usuario">
        </form>
        <div>
            <a style="color:black;"href="index.jsp">login</a>
        </div>
    </div>
</div>
</body>
</html>
