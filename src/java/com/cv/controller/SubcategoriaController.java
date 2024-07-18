package com.cv.controller;

import com.cv.DAO.SubcategoriaDAO;
import com.cv.model.entity.Subcategoria;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SubcategoriaController extends HttpServlet {

    int id;
    SubcategoriaDAO subcatedao = new SubcategoriaDAO();
    Subcategoria subcategoria = new Subcategoria();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion.equals("add")) {
            this.add(request, response);
        }
        if (accion.equals("Actualizar")) {
            this.Edit(request, response);
        }
        if (accion.equals("eliminar")) {
            this.eliminar(request, response);
        }
        if (accion.equals("Estado")) {
            this.Estado(request, response);
        }
    }

    private void add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Subcategoria subcat = new Subcategoria();
        String codig = request.getParameter("txtCod");
        String nom = request.getParameter("txtNom");
        subcat.setCodigo(codig);
        subcat.setNombre(nom);
        subcat.setEstado("Activo");
        SubcategoriaDAO subcatdao = new SubcategoriaDAO();
        boolean validacion = false;
        validacion = subcatdao.validacion(nom);
        if (validacion == true) {
            response.getWriter().print("yaexiste");
        } else {
        if (subcatdao.add(subcat)) {
            response.getWriter().print("ok");
        } else {
            response.getWriter().print("No ha sido registrado correctamente");
        }
    }}

    private void Edit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("txtid"));
        String cod = request.getParameter("TxtCod");
        String nombre = request.getParameter("Txtnombre");
        subcategoria.setIdsubc(id);
        subcategoria.setCodigo(cod);
        subcategoria.setNombre(nombre);
        if (subcatedao.Edit(subcategoria)) {
            response.getWriter().print("ok");
        } else {
            response.getWriter().print("El proveedor no ha sido registrado correctamente");
        }
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("idSubc"));
        System.out.println("[ID] " + id);
        subcatedao.Eliminar(id);
    }

    private void Estado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("id"));
        String estado = SubcategoriaDAO.getSubCategoriaEstado(id);
        if (estado.equalsIgnoreCase("Activo")) {
            subcategoria.setEstado("Desactivado");
        } else {
            subcategoria.setEstado("Activo");
        }
        subcatedao.EditarEstado(subcategoria, id);
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
