package com.cv.controller;

import com.cv.DAO.UsuarioDAO;
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

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)

public class UsuarioController extends HttpServlet {

    int id;
    UsuarioDAO usuarioDao = new UsuarioDAO();
    Usuario usuario = new Usuario();
    UsuarioDAO usuDAO;
    DecimalFormat dfusu;
    public static final String UPLOAD_DIR = "images";

    public String dbFileName1 = "";

    public UsuarioController() {
        usuDAO = new UsuarioDAO();

        dfusu = new DecimalFormat("000000");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion.equals("add")) {
            this.add(request, response);
        }
        if (accion.equals("Actualizar")) {
            this.Edit(request, response);
        }
        if (accion.equals("editar")) {
            this.Editar(request, response);
        }
        if (accion.equals("detalle")) {
            this.Detalle(request, response);
        }
        if (accion.equals("eliminar")) {
            this.eliminar(request, response);
        }
    }

    private void add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Usuario usu = new Usuario();

        String nombre = request.getParameter("txtNombre");
        String idtipodocumento = request.getParameter("Txtidtipodocumento");
        String numDoc = request.getParameter("dni");
        String sueldo = request.getParameter("Txtsueldo");
        String telefono = request.getParameter("Txttelefono");
        String direccion = request.getParameter("Txtdireccion");
        String email = request.getParameter("Txtemail");
        String fechaderegistro = request.getParameter("Txtfechaderegistro");
        String Usua = request.getParameter("txtusu");
        String pass = request.getParameter("txtpassword");
        //hashpass
        String hashedPassword = PasswordUtils.hashPassword(pass);
        //====
        String rol = request.getParameter("txtrol");
        //Se genera un código para el usuario
        int Nusuarios = usuDAO.BuscarNusuarios();
        Nusuarios = Nusuarios + 1;
        String format = dfusu.format(Nusuarios);
        //manejo de la subida de archivos
        Part part = request.getPart("file1");
        String fileName1 = extractFileName(part);//file name
        //Se configuran las rutas para guardar el archivo de imagen y se almacena en el sistema.
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
        //File fileSaveDir1 = new File(savePath1);
        dbFileName1 = UPLOAD_DIR + File.separator + fileName1;
        part.write(savePath1 + File.separator);

        //Se configuran los atributos del objeto Usuario con los valores obtenidos de los parámetros de la solicitud 
        //y del manejo de archivos.
        usu.setCodigo(format);
        usu.setIdTipodocumento(Integer.parseInt(idtipodocumento));
        usu.setNrodocumento(numDoc);
        usu.setNombre(nombre);
        usu.setSueldo(Double.parseDouble(sueldo));
        usu.setTelefono(telefono);
        usu.setDireccion(direccion);
        usu.setEmail(email);
        usu.setFechaderegistro(fechaderegistro);
        usu.setUsu(Usua);
        usu.setPassword(hashedPassword);
        usu.setRol(rol);
        usu.setFilename1(dbFileName1);
        usu.setPath1(savePath1);
        usu.setEstado("Activo");

        UsuarioDAO usudao = new UsuarioDAO();
        boolean validacion = false;
        validacion = usudao.vali(usu);
        if (validacion == true) {
            response.getWriter().print("yaexiste");
        } else {
            if (usudao.addimg(usu)) {
                response.getWriter().print("ok");
            } else {
                response.getWriter().print("no ha sido registrado correctamente");
            }
        }
    }

    private void Editar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("idusu", request.getParameter("id"));
        request.getRequestDispatcher("EditarUsuario.jsp").forward(
                request, response);
    }

    private void Detalle(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("idusu", request.getParameter("id"));
        request.getRequestDispatcher("DetalleUsuario.jsp").forward(
                request, response);
    }

    private void Edit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("txtid"));
//        int idempleados = Integer.parseInt(request.getParameter("txtidempleado"));
        String nombre = request.getParameter("Txtnombre");
        String usuarios = request.getParameter("Txtnomusu");
        String pass = request.getParameter("Txtpass");
        String rol = request.getParameter("Txtrol");
        String imgactual = request.getParameter("txtImagen");
        Part part = request.getPart("txtModificarImagen");//

        usuario.setId(id);
        usuario.setNombre(nombre);
        usuario.setUsu(usuarios);
        usuario.setPassword(pass);
        usuario.setRol(rol);

        String imagen = request.getParameter("selected");

        if (imagen.equals("SelectImagenActual")) {
            usuario.setFilename1(imgactual);
            usuario.setPath1(imgactual);

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
            usuario.setFilename1(dbFileName1);
            usuario.setPath1(savePath1);
        }

        if (usuDAO.Editimgg(usuario)) {
            response.getWriter().print("ok");

        } else {
            response.getWriter().print("El cliente no ha sido registrado");

        }
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("idUsu"));
        System.out.println("[ID] " + id);
        usuDAO.Eliminar(id);
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
