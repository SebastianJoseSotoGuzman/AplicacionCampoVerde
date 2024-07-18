<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.cv.model.entity.Message" %>
<%@ page import="com.cv.model.entity.Usuario" %>

<%
    List<Message> messages = (List<Message>) request.getAttribute("messages");
%>
<ul class="messages-list">
    <%
        if (messages != null && !messages.isEmpty()) {
            for (Message msg : messages) {
                out.println("<li class='message-item'><strong>" + msg.getUser() + ":</strong> " + msg.getMessage() + " <span class='timestamp'>" + msg.getFormattedTimestamp() + "</span>");
                if (msg.getFileName() != null) {
                    out.println("<br><a href='" + msg.getFileUrl() + "'>Descargar archivo</a>");
                }
                out.println("</li>");
            }
        } else {
            out.println("<li class='message-item'>No hay mensajes</li>");
        }
    %>
</ul>
