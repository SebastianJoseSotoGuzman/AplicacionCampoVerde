
package com.cv.controller;
import com.cv.model.entity.ChatManager;
import com.cv.model.entity.Message;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;


@WebServlet("/chat")
@MultipartConfig
public class ChatServlet extends HttpServlet {
    private static final String UPLOAD_DIR = "uploads";
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("user");
        String message = request.getParameter("message");

        Part filePart = request.getPart("file");
        String fileName = null;
        if (filePart != null && filePart.getSize() > 0) {
            fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            filePart.write(uploadPath + File.separator + fileName);
        }

        if (user != null && message != null && !user.trim().isEmpty() && !message.trim().isEmpty()) {
            ChatManager.addMessage(new Message(user, message, System.currentTimeMillis(), fileName));
        }

        response.sendRedirect("chat2.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean isAjax = "true".equals(request.getParameter("ajax"));
        request.setAttribute("messages", ChatManager.getMessages());
        
        if (isAjax) {
            request.getRequestDispatcher("messages.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("chat2.jsp").forward(request, response);
        }
    }
}