<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Iniciar Sesión</title>
</head>
<body>
<% if (request.getParameter("error") != null) { %>
<p style="color:red;">Error al iniciar sesión. Verifica tus credenciales.</p>
<% } %>
<form action="login" method="post">
    Usuario: <input type="text" name="username" required><br>
    Contraseña: <input type="password" name="password" required><br>
    <input type="submit" value="Iniciar Sesión">
</form>
</body>
</html>
