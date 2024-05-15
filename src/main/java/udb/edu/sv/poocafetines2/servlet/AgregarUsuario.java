package udb.edu.sv.poocafetines2.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import udb.edu.sv.poocafetines2.clases.Conexion;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/AgregarUsuario")
public class AgregarUsuario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try{
            final String nombres = request.getParameter("nombres");
            final String apellidos = request.getParameter("apellidos");
            final String carnet = request.getParameter("carnet");
            final String cargo = request.getParameter("cargo");
            final String usuario = request.getParameter("carnet");
            final String contraseña = request.getParameter("contraseña");
            final String query = "insert into usuarios (carnet, nombres, apellidos, cargo, usuario, contraseña) values ('"+carnet+"','"+nombres+"','"+apellidos+"','"+cargo+"','"+usuario+"','"+contraseña+"')";

            Conexion c = new Conexion();
            c.setQuery(query);

            response.sendRedirect("AgregarExito.jsp");

        }catch(SQLException e){
            e.printStackTrace();
            response.sendRedirect("AgregarError.jsp");
        }

    }
}
