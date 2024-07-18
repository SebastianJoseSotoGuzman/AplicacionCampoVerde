package com.cv.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/ProcesarPagoServlet")
public class ProcesarPagoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener parámetros del formulario
        String nombre_completo = request.getParameter("full_name");
        String email = request.getParameter("email");
        String direccion = request.getParameter("address");
        String ciudad = request.getParameter("city");
        String estado = request.getParameter("state");
        String codigo_postal = request.getParameter("postal_code");
        String nombre_tarjeta = request.getParameter("card_name");
        String numero_tarjeta = request.getParameter("card_number");
        String mes_expiracion = request.getParameter("exp_month");
        String ano_expiracion = request.getParameter("exp_year");
        String cvv = request.getParameter("cvv");

        // Configuración de la base de datos
        String jdbcURL = "jdbc:mysql://localhost/campo_verde";
        String dbUser = "root";
        String dbPassword = "";

        try {
            // Cargar el controlador JDBC
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Consulta SQL para insertar los datos
            try ( // Establecer conexión con la base de datos
                    Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
                // Consulta SQL para insertar los datos
                String sql = "INSERT INTO pagos (nombre_completo, email, direccion, ciudad, estado, codigo_postal, nombre_tarjeta, numero_tarjeta, mes_expiracion, ano_expiracion, cvv) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, nombre_completo);
                statement.setString(2, email);
                statement.setString(3, direccion);
                statement.setString(4, ciudad);
                statement.setString(5, estado);
                statement.setString(6, codigo_postal);
                statement.setString(7, nombre_tarjeta);
                statement.setString(8, numero_tarjeta);
                statement.setString(9, mes_expiracion);
                statement.setString(10, ano_expiracion);
                statement.setString(11, cvv);
                // Ejecutar la consulta
                int rows = statement.executeUpdate();
                // Verificar si la inserción fue exitosa
                if (rows > 0) {
                    response.sendRedirect("success.jsp");
                } else {
                    response.getWriter().println("Error al procesar el pago.");
                }
                // Cerrar la conexión
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
