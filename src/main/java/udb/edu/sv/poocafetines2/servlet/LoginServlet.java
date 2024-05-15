package udb.edu.sv.poocafetines2.servlet;

import udb.edu.sv.poocafetines2.clases.Conexion;
import udb.edu.sv.poocafetines2.modelos.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Usuario usuario = validarCredenciales(username, password);

        if (usuario != null) {
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);
            response.sendRedirect("welcome.jsp");
        } else {
            response.sendRedirect("index.jsp?error=1");
        }
    }

    private Usuario validarCredenciales(String username, String password) {
        try (Conexion conexion = new Conexion()) {
            String query = "SELECT * FROM usuarios WHERE usuario = '" + username + "' AND contraseña = '" + password + "'";
            conexion.setRs(query);
            ResultSet resultSet = conexion.getRs();

            if (resultSet != null && resultSet.next()) {
                Usuario usuario = new Usuario();
                usuario.setUsername(resultSet.getString("usuario"));
                usuario.setRol(resultSet.getString("cargo"));
                return usuario;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
