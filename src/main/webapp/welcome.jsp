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
    <!-- Aquí puedes agregar cualquier contenido adicional que desees en el cuerpo de la página -->
    <a href="RegistCafe.jsp">registrar cafetin</a>
</div>
<% } %>
</body>
</html>
