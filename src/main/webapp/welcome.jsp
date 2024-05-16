<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="udb.edu.sv.poocafetines2.modelos.Usuario" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            background-color: aqua;
            margin: 0;
            padding: 0;
            font-family: "Arial Black", sans-serif;
        }
        .header {
            width: 100%;
            background-color: white;
            padding: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            top: 0;
            left: 0;
        }
        .header h1 {
            margin: 0;
        }
        .header .rol {
            background-color: cadetblue;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
        }
        .header .logout {
            background-color: #004466;
            color: white;
            padding: 10px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            margin-left: 10px;
        }
        .header .logout:hover {
            background-color: #003355;
        }
        .content {
            margin-top: 60px; /* Ajusta esto si la altura de la cabecera cambia */
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 60px);
        }
        .button-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            grid-gap: 20px;
        }
        .button {
            background-color: green;
            color: white;
            padding: 20px;
            text-align: center;
            border-radius: 10px;
            text-decoration: none;
            font-size: 18px;
            transition: background-color 0.3s;
        }
        .button:hover {
            background-color: darkgreen;
        }
    </style>
    <meta charset="UTF-8">
    <title>Bienvenido</title>
</head>
<body>
<%
    HttpSession currentSession = request.getSession(false);
    Usuario usuario = (Usuario) currentSession.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("index.jsp");
    } else {
%>
<div class="header">
    <h1>Bienvenido, <%= usuario.getNombre() %>!</h1>
    <div>
        <span class="rol">Rol: <%= usuario.getRol() %></span>
        <a href="logout" class="logout">Cerrar Sesión</a>
    </div>
</div>
<div class="content">
    <div class="button-container">
        <a href="RegistCafe.jsp" class="button">Registrar Cafetín</a>
        <a href="Eventos.jsp" class="button">Registrar Nuevo Evento</a>
        <a href="Opcion3.jsp" class="button">Opción 3</a>
        <a href="Opcion4.jsp" class="button">Opción 4</a>
    </div>
</div>
<% } %>
</body>
</html>
