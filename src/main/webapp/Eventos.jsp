<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Agregar un evento</title>
</head>
<body>
<div>
    <form action="EventoServlet" method="post">
        <label for="tipo">Tipo de Evento</label>
        <select id="tipo" name="tipo">
            <option value="pequeño">Pequeño</option>
            <option value="mediano">Mediano</option>
            <option value="grande">Grande</option>
        </select>
        <br>
        <br>
        <label for="nombre">Nombre Del Evento</label>
        <input id="nombre" type="text" name="nombre">
        <br>
        <br>
        <label for="direccion">Direccion donde necesitara el evento</label>
        <input type="text" id="direccion" name="direccion">
        <br>
        <br>
        <label for="hora">Hora del evento</label>
        <input type="datetime-local" id="hora" name="hora">
        <br>
        <br>
        <input type="submit" value="Agregar Evento">
        <br>
        <br>
        <a href="verEventos.jsp">Ver los eventos agregados</a>
    </form>
</div>
</body>
</html>
