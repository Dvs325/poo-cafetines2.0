package udb.edu.sv.poocafetines2.clases;

import java.sql.*;

public class Conexion implements AutoCloseable {
    private Connection conexion = null;
    private Statement s = null;
    private ResultSet rs = null;

    //Constructor
    public Conexion() throws SQLException {
        try {
            // Obtener el driver para MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Obtener una conexión con la base de datos
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafetines","root","");
            // Permite ejecutar sentencias SQL sin parámetros
            s = conexion.createStatement();
        } catch (ClassNotFoundException e1) {
            // Error si no puedo leer el driver de MySQL
            System.out.println("ERROR: No se pudo cargar el driver de la BD: " + e1.getMessage());
        }
    }

    //metodo que devuelve la conexion
    public Connection getConexion() {
        return conexion;
    }

    // Método que permite obtener los valores del ResultSet
    public ResultSet getRs() {
        return rs;
    }

    // Método que fija la tabla resultado de la pregunta SQL realizada
    public void setRs(String consulta) {
        try {
            if (s != null) {
                this.rs = s.executeQuery(consulta);
            } else {
                System.out.println("ERROR: Statement no inicializado");
            }
        } catch (SQLException e2) {
            System.out.println("ERROR: Fallo en SQL: " + e2.getMessage());
        }
    }

    // Método que recibe un SQL como parámetro que sea un update, insert, delete
    public void setQuery(String query) throws SQLException {
        if (s != null) {
            this.s.executeUpdate(query);
        } else {
            System.out.println("ERROR: Statement no inicializado");
        }
    }

    // Método que cierra la conexión
    public void cerrarConexion() throws SQLException {
        if (conexion != null) {
            conexion.close();
        }
    }

    // Método close() para implementar AutoCloseable
    @Override
    public void close() throws SQLException {
        cerrarConexion();
    }
}