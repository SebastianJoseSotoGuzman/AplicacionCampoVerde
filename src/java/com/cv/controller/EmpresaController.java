package com.cv.controller;

import com.cv.DAO.EmpresaDAO;
import com.cv.DAO.UsuarioDAO;
import static com.cv.controller.UsuarioController.UPLOAD_DIR;
import com.cv.model.entity.Empresa;
import com.cv.model.entity.Usuario;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;


@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)

public class EmpresaController extends HttpServlet {

    int id;
    EmpresaDAO empresaDao = new EmpresaDAO();
    Empresa empresa = new Empresa();
    EmpresaDAO empDAO;
    DecimalFormat formateadorcliente;
    ArrayList<String> listaErrores = new ArrayList<>();

    public static final String UPLOAD_DIR = "images";
    public String dbFileName1 = "";

    public EmpresaController() {
        empDAO = new EmpresaDAO();
        formateadorcliente = new DecimalFormat("000000");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion.equals("editar")) {
            this.Editar(request, response);
        }
        if (accion.equals("Actualizar")) {
            this.Edit(request, response);
        }

    }

    private void Editar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("idemp", request.getParameter("id"));
        request.getRequestDispatcher("EditarEmpresa.jsp").forward(
                request, response);
    }

    private void Edit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("txtid"));
//        int idempleados = Integer.parseInt(request.getParameter("txtidempleado"));
        String nombre = request.getParameter("Txtnombre");
        String Nro = request.getParameter("TxtNro");
        String Direccion = request.getParameter("Txtdireccion");
        String Ubigeo = request.getParameter("Txtubigeo");
        String Adicional = request.getParameter("Txtadicional");
        String imgactual = request.getParameter("txtImagen");
        Part part = request.getPart("txtModificarImagen");//

        empresa.setId(id);
        empresa.setNombre(nombre);
        empresa.setNro(Nro);
        empresa.setDireccion(Direccion);
        empresa.setUbigeo(Ubigeo);
        empresa.setAdicional(Adicional);

        String imagen = request.getParameter("selected");

        if (imagen.equals("SelectImagenActual")) {
            empresa.setFilename1(imgactual);
            empresa.setPath1(imgactual);

        } else {
            String fileName1 = extractFileName(part);//file name
            String applicationPath = getServletContext().getRealPath("");
            String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
            System.out.println("applicationPath:" + applicationPath);
            File fileUploadDirectory = new File(uploadPath);
            if (!fileUploadDirectory.exists()) {
                fileUploadDirectory.mkdirs();
            }
            String savePath1 = uploadPath + File.separator + fileName1;

            //Imagen1
            System.out.println("savePath: " + savePath1);
            String sRootPath = new File(savePath1).getAbsolutePath();
            System.out.println("sRootPath: " + sRootPath);
            part.write(savePath1 + File.separator);
            File fileSaveDir1 = new File(savePath1);
            dbFileName1 = UPLOAD_DIR + File.separator + fileName1;
            part.write(savePath1 + File.separator);
            empresa.setFilename1(dbFileName1);
            empresa.setPath1(savePath1);
        }

        if (empDAO.Editimgg(empresa)) {
            response.getWriter().print("ok");

        } else {
            response.getWriter().print("No se registro");

        }
    }

    private String extractFileName(Part part) {//This method will print the file name.
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
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
