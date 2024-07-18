package com.cv.controller;

import com.cv.DAO.UsuarioDAO;
import com.cv.DAO.loginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LoginController extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String usuario;
            String password;
            String hashpass;
            String tipo = "";
            int resultado;
            int id;
            loginDAO CBD = new loginDAO();
            RequestDispatcher rd = null;
            if (request.getParameter("btnEntrar") != null) {

                usuario = request.getParameter("txtUsuario");
                password = request.getParameter("txtPassword");
                hashpass=PasswordUtils.hashPassword(password);
                UsuarioDAO o = new UsuarioDAO();
                resultado = o.usu(usuario, hashpass);
                if (resultado == 0) {
                    request.setAttribute("mensaje", "<p style='color:red'>Usuario y password Incorrectos</p>");
                    rd = request.getRequestDispatcher("login.jsp");
                } else {
                    tipo = CBD.Validar(usuario, hashpass);
                    request.setAttribute("tipo", tipo);
                    request.setAttribute("usuario", usuario);
                    rd = request.getRequestDispatcher("login.jsp");
                }

            }

            rd.forward(request, response);

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
