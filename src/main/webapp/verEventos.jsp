<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Visualización de Notas Escolares</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
            color: #333;
        }
        .box {
            max-width: 600px;
            padding: 20px;
            background-color: white;
            margin: 0 auto;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #eee;
        }
        .button {
            padding: 10px 20px;
            margin: 10px 5px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            color: white;
            background-color: #007bff;
        }
        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="box">
    <h1>Visualización de Estudiantes registrados</h1>
    <table>
        <tr>
            <th>Identificador</th>
            <th>Nombre</th>
            <th>identificador del menu</th>
            <th>Fecha y hora</th>
            <th>Direccio</th>
            <th>precio</th>
        </tr>
        <%-- Obtener datos de la base de datos y mostrarlos --%>
        <%@ page import="udb.edu.sv.poocafetines2.clases.Conexion" %>
        <%@ page import="java.sql.*" %>
        <% try {
            Conexion conexion = new Conexion();
            //conexion.setRs("SELECT estudiantes.IDEstudiantes AS alumno, materias.Materia AS materia, notas.Notas FROM notas INNER JOIN estudiantes ON notas.IDEstudiantes = estudiantes.IDEstudiantes INNER JOIN materias ON notas.Materias = materias.Materia");
            conexion.setRs("select * from eventos");
            ResultSet rs = conexion.getRs();
            while (rs.next()) { %>
        <tr>
            <td><%= rs.getString("idevento") %></td>
            <td><%= rs.getString("nombrevento") %></td>
            <td><%= rs.getString("idmenu") %></td>
            <td><%= rs.getString("fecha_y_hora") %></td>
            <td><%= rs.getString("direccionevento")%></td>
            <td>$<%= rs.getString("precio")%></td>
        </tr>
        <%      }
            rs.close();
            conexion.cerrarConexion();
        } catch (SQLException e) {
            e.printStackTrace();
            // Manejar el error
        } %>
    </table>
    <button class="button" onclick="window.location.href='eventos.jsp';">Regresar</button>
</div>
</body>
</html>