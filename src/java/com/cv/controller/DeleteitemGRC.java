
package com.cv.controller;

import com.cv.DAO.ProductoDAO;
import com.cv.model.entity.DetalleMovimiento;
import com.cv.model.entity.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class DeleteitemGRC extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
        HttpSession sesion = request.getSession();
        ArrayList<DetalleMovimiento> cargrc;//
        if (sesion.getAttribute("cargrc") == null) {
            cargrc = new ArrayList<DetalleMovimiento>();
        } else {
            cargrc = (ArrayList<DetalleMovimiento>) sesion.getAttribute("cargrc");
        }
        Producto p = ProductoDAO.obtenerProducto(Integer.parseInt(request.getParameter("idproducto")));
        if(cargrc != null){
            for(DetalleMovimiento a : cargrc){                
                if(a.getIdproducto() == p.getIdproducto()){
                    cargrc.remove(a);
                    break;
                }
            }
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
