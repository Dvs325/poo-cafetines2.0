<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Iniciar Sesión</title>
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
<% if (request.getParameter("error") != null) { %>
<p class="error">Error al iniciar sesión. Verifica tus credenciales.</p>
<% } %>
<div class="container">
    <div class="form">
        <h2>Ingresar</h2>
        <form action="login" method="post">
            <label for="username">Usuario:</label>
            <input type="text" id="username" name="username" required><br>
            <label for="password">Contraseña:</label>
            <input type="password" id="password" name="password" required><br>
            <input type="submit" value="Iniciar Sesión">
        </form>
        <div>
            <p style="color:black;">¿No tienes cuenta?.<br> Crea una <a href="agregar.jsp">aqui</a></p>

        </div>
    </div>
</div>
</body>
</html>
