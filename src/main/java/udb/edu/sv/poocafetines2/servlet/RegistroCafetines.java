package udb.edu.sv.poocafetines2.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import udb.edu.sv.poocafetines2.clases.Conexion;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "RegistroCafetines", urlPatterns = "/RegistroCafetines")
public class RegistroCafetines extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private List<RegistroCafetin> listaCafetines = new ArrayList<>();

    public RegistroCafetines() {}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //int idCafetin = 0;//Integer.parseInt(request.getParameter("idCafetin"));

        String idCafetinStr = request.getParameter("idCafetin");
        int idCafetin = (idCafetinStr != null && !idCafetinStr.isEmpty()) ? Integer.parseInt(idCafetinStr) : 0;


        String nombreCafetin = request.getParameter("nombre");
        String direccionCafetin = request.getParameter("direccion");

        try{
            Conexion c = new Conexion();
            c.setRs("INSERT INTO `cafetines`(`nombre`, `direccion`) VALUES ('"+nombreCafetin+"','"+direccionCafetin+"')");

            response.sendRedirect("CafetinExito.jsp");
        }catch(SQLException e){
            e.printStackTrace();
        }

        RegistroCafetin cafetin = new RegistroCafetin(idCafetin, nombreCafetin, direccionCafetin);

        listaCafetines.add(cafetin);

        // Obtener los nombres y precios de los productos
        String[] nombresProductos = request.getParameterValues("productoNombre");
        String[] preciosProductos = request.getParameterValues("productoPrecio");
        if (nombresProductos != null && preciosProductos != null) {
            for (int i = 0; i < nombresProductos.length; i++) {
                String nombreProducto = nombresProductos[i];
                double precioProducto = Double.parseDouble(preciosProductos[i]);
                cafetin.agregarAlMenu(nombreProducto + " - Precio: $" + precioProducto);
            }
        }
        response.sendRedirect("exito.html");
    }

    public class RegistroCafetin {
        private int idCafetin;
        private String nombre;
        private String direccion;
        private List<String> menu;

        public RegistroCafetin(int idCafetin, String nombre, String direccion) {
            this.idCafetin = idCafetin;
            this.nombre = nombre;
            this.direccion = direccion;
            this.menu = new ArrayList<>();
        }

        public void agregarAlMenu(String item) {
            menu.add(item);
        }

        // Los métodos agregarProductoAlMenu() y mostrarMenu() no son necesarios aquí

        public int getIdCafetin() {
            return idCafetin;
        }

        public String getNombre() {
            return nombre;
        }

        public String getDireccion() {
            return direccion;
        }
    }
}
