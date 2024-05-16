import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProcesarPedidoServlet")
public class ProcesarPedidoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String carnet = request.getParameter("carnet");
        String iddes = request.getParameter("iddes");
        String idal = request.getParameter("idal");
        String idsnack = request.getParameter("idsnack");
        String idbebida = request.getParameter("idbebida");
        String precio = request.getParameter("precio");
        String hora = request.getParameter("hora");
        String dia = request.getParameter("dia");

        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/nombre_basedatos";
            String username = "usuario";
            String password = "contraseña";
            conn = DriverManager.getConnection(url, username, password);
            String query = "INSERT INTO pedidos (carnet, iddes, idal, idsnack, idbebida, precio, hora, dia) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, carnet);
            ps.setString(2, iddes);
            ps.setString(3, idal);
            ps.setString(4, idsnack);
            ps.setString(5, idbebida);
            ps.setString(6, precio);
            ps.setString(7, hora);
            ps.setString(8, dia);
            ps.executeUpdate();
            response.getWriter().println("Pedido tomado exitosamente");
        } catch (Exception e) {
            response.getWriter().println("Error al tomar pedido: " + e.getMessage());
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                response.getWriter().println("Error al cerrar la conexión: " + e.getMessage());
            }
        }
    }
}
