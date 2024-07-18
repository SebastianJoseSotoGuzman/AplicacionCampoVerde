package com.cv.controller;

import com.cv.DAO.ProductoDAO;
import com.cv.model.entity.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ProductoController extends HttpServlet {

    int id;
    Producto p = new Producto();
    ProductoDAO pdao = new ProductoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion.equals("add")) {
            this.add(request, response);
        }
        if (accion.equals("editar")) {
            this.Editar(request, response);
        }
        if (accion.equals("actualizar")) {
            this.Edit(request, response);
        }
        if (accion.equals("detalle")) {
            this.Detalle(request, response);
        }
        if (accion.equals("Editarstockminmax")) {
            this.Editarstockminmax(request, response);
        }
        if (accion.equals("eliminar")) {
            this.eliminar(request, response);
        }
        if (accion.equals("estado")) {
            this.estado(request, response);
        }

    }

    private void add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Producto p = new Producto();
        String codigo = request.getParameter("Txtcodigo");
        String descripcion = request.getParameter("Txtdescripcion");
        int clasi = Integer.parseInt(request.getParameter("Txtmarca"));
        int categoria = Integer.parseInt(request.getParameter("Txtcategoria"));
        int subc = Integer.parseInt(request.getParameter("TxtIdpublico"));
        int unidadv = Integer.parseInt(request.getParameter("Txtunidadv"));
        String Codanexo = request.getParameter("Txtcodanexo");
        double pcompra = Double.parseDouble(request.getParameter("Txtpcompra"));
        double pventa = Double.parseDouble(request.getParameter("Txtpventa"));
        String fecha = request.getParameter("Txtfechaderegistro");
        String obser = request.getParameter("Txtobser");

        p.setCodigo(codigo);
        p.setDescripcion(descripcion);
        p.setIdclasi(clasi);
        p.setIdcategoria(categoria);
        p.setIdsubc(subc);
        p.setIdauxiliar(1);
        p.setIduventa(unidadv);
        p.setMoneda("Soles");
        p.setCodigoanexo(Codanexo);
        p.setPreciocompra(pcompra);
        p.setPrecioVenta(pventa);
        p.setFechaRegistro(fecha);
        p.setObser(obser);
        p.setStock(0.00);
        p.setStockminimo(0.00);
        p.setStockmaximo(0.00);
        p.setEstado("Activo");
        ProductoDAO prodao = new ProductoDAO();
        boolean validacion = false;
        validacion = prodao.validacion(Codanexo);
        if (validacion == true) {
            response.getWriter().print("yaexiste");
        } else {
            if (prodao.add(p)) {
                response.getWriter().print("ok");

            } else {
                response.getWriter().print("no ha sido registrado correctamente");

            }
        }
    }

    private void Editar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("idpro", request.getParameter("id"));
        request.getRequestDispatcher("EditarProducto.jsp").forward(
                request, response);
    }

    private void Detalle(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("idpro", request.getParameter("id"));
        request.getRequestDispatcher("DetalleProducto.jsp").forward(
                request, response);
    }

    private void Edit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("txtid"));
        String codigo = request.getParameter("Txtcodigo");
        String descripcion = request.getParameter("Txtdescripcion");
        int clasi = Integer.parseInt(request.getParameter("Txtmarca"));
        int categoria = Integer.parseInt(request.getParameter("Txtcategoria"));
        int subc = Integer.parseInt(request.getParameter("TxtIdpublico"));
        int unidadv = Integer.parseInt(request.getParameter("Txtunidadv"));
        String Codanexo = request.getParameter("Txtcodanexo");
        String pcompra = request.getParameter("Txtpcompra");
        String pventa = request.getParameter("Txtpventa");
        String fecha = request.getParameter("Txtfechaderegistro");
        String observ = request.getParameter("Txtobser");

        p.setIdproducto(id);
        p.setCodigo(codigo);
        p.setDescripcion(descripcion);
        p.setIdclasi(clasi);
        p.setIdcategoria(categoria);
        p.setIdsubc(subc);
        p.setIdauxiliar(1);
        p.setIduventa(unidadv);
        p.setMoneda("Soles");
        p.setCodigoanexo(Codanexo);
        p.setPreciocompra(Float.parseFloat(pcompra));
        p.setPrecioVenta(Float.parseFloat(pventa));
        p.setFechaRegistro(fecha);
        p.setObser(observ);
        if (pdao.Edit(p)) {
            response.getWriter().print("ok");
        } else {
            response.getWriter().print("El producto no ha sido registrado correctamente");
        }
    }

    private void Editarstockminmax(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("txtid"));
        String codigo = request.getParameter("Txtcodigo");
        String descripcion = request.getParameter("Txtdescripcion");
        String pcompra = request.getParameter("Txtpcompra");
        String pventa = request.getParameter("Txtpventa");
        p.setIdproducto(id);
        p.setCodigo(codigo);
        p.setDescripcion(descripcion);
        p.setStockminimo(Float.parseFloat(pcompra));
        p.setStockmaximo(Float.parseFloat(pventa));
        if (pdao.Editstockminmax(p)) {
            response.getWriter().print("ok");
        } else {
            response.getWriter().print("El producto no ha sido registrado correctamente");
        }
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("idPro"));
        pdao.Eliminar(id);
        ProductoDAO clidao = new ProductoDAO();
        
        boolean validacion = false;
        validacion = clidao.Yatienemovimiento(id);
        if (validacion == true) {
            response.getWriter().print("tienemovi");
        }
    }

    private void estado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("id"));
        p.setIdproducto(id);

        String estado = ProductoDAO.estado(id);
        String estadoo = ProductoDAO.estadoalmacenp(id);
        if (estado.equalsIgnoreCase("Activo")) {
            p.setEstado("Desactivado");
        } else {
            p.setEstado("Activo");
        }
        pdao.editEstado(p, id);
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
