package udb.edu.sv.poocafetines2.servlet;

import udb.edu.sv.poocafetines2.clases.Conexion;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

@WebServlet("/EventoServlet")
public class EventoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String tipo = request.getParameter("tipo");
        String nombre = request.getParameter("nombre");
        String direccion = request.getParameter("direccion");
        String hora = request.getParameter("hora");
        int precio = 0;
        int menu = 0;
        int extra = 0;

        try {
            switch (tipo){
                case "pequeño":
                    precio = 50;
                    menu = 1;
                    break;
                case "mediano":
                    precio = 100;
                    menu = 2;
                    break;
                case "grande":
                    precio = 150;
                    menu = 3;
                    break;
                default:
                    throw new IllegalArgumentException("Tipo de evento desconocido: " + tipo);
            }

            DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
            LocalDateTime dateTime = LocalDateTime.parse(hora, inputFormatter);

            DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
            String formattedDate = dateTime.format(outputFormatter);

            Conexion c = new Conexion();
            final String query = "INSERT INTO `eventos` (nombrevento, idmenu, fecha_y_hora,idextra, direccionevento, precio) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = c.getConexion().prepareStatement(query);
            statement.setString(1, nombre);
            statement.setInt(2, menu);
            statement.setString(3, formattedDate);
            statement.setInt(4,extra);
            statement.setString(5, direccion);
            statement.setInt(6, precio);

            // Ejecutar la consulta de inserción
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("Evento agregado exitosamente!");
            }

            statement.close();
            c.cerrarConexion();

            response.sendRedirect("CafetinExito.jsp");

        } catch (DateTimeParseException e) {
            e.printStackTrace();
            response.sendRedirect("CafetinError.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("CafetinError.jsp");
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            response.sendRedirect("CafetinError.jsp");
        }
    }
}
