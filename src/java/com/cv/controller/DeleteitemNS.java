/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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



public class DeleteitemNS extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

         response.setContentType("text/html;charset=UTF-8");
        HttpSession sesion = request.getSession();
        ArrayList<DetalleMovimiento> caroc;//
        if (sesion.getAttribute("carns") == null) {
            caroc = new ArrayList<DetalleMovimiento>();
        } else {
            caroc = (ArrayList<DetalleMovimiento>) sesion.getAttribute("carns");
        }
        Producto p = ProductoDAO.obtenerProducto(Integer.parseInt(request.getParameter("idproducto")));
        if(caroc != null){
            for(DetalleMovimiento a : caroc){                
                if(a.getIdproducto() == p.getIdproducto()){
                    caroc.remove(a);
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
