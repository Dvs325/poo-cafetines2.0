package udb.edu.sv.poocafetines2.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import udb.edu.sv.poocafetines2.clases.Conexion;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/RegistroCafetines2")
public class RegistroCafetines2 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try{
            final String nombreCafetin = request.getParameter("nombre");
            final String direccionCafetin = request.getParameter("direccion");
            Conexion c = new Conexion();
            final String query = "INSERT INTO cafetines(nombre, direccion) VALUES (?,?)";

            PreparedStatement statement = c.getConexion().prepareStatement(query);
            statement.setString(1, nombreCafetin);
            statement.setString(2,direccionCafetin);
            statement.executeUpdate();
            statement.close();
            c.cerrarConexion();

            response.sendRedirect("CafetinExito.jsp");

        }catch(SQLException e){
            e.printStackTrace();
            response.sendRedirect("CafetinError.jsp");
        }

    }
}
