<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="udb.edu.sv.poocafetines2.modelos.Usuario" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <!--link href="css/style.css"-->
    <style>
        body {
            background-color: aqua;
        }
    </style>
    <meta charset="UTF-8">
    <title>Bienvenido</title>
</head>
<body>
<%
    // Obtener la sesión existente si está disponible
    HttpSession currentSession = request.getSession(false);
    Usuario usuario = (Usuario) currentSession.getAttribute("usuario");
    if (usuario == null) {
        // Redirigir a la página de inicio de sesión si el usuario no está autenticado
        response.sendRedirect("index.jsp");
    } else {
%>
<h1>Bienvenido, <%= usuario.getUsername() %>!</h1>
<p>Rol: <%= usuario.getRol() %></p>
<a href="logout">Cerrar Sesión</a>
<% } %>
</body>
</html>
