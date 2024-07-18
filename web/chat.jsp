

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">

        <title>Chat</title>
        <%@include file="css-plantilla.jsp"%> 
        <%@include file="css-datatable.jsp"%>
        <link rel="stylesheet" type="text/css" href="css/chat.css">

    </head>
    <body onload="startLoadingMessages()">
        <%@include file="Frmmenu.jsp" %>
        <div class="chat-container">
            <h1>Chat</h1>
            <form action="chat" method="post" enctype="multipart/form-data" class="chat-form">
                <div class="form-group">
                    <label for="user">Nombre:</label>
                    <input type="text" id="user" name="user" required>
                </div>
                <div class="form-group">
                    <label for="message">Mensaje:</label>
                    <input type="text" id="message" name="message" required>
                </div>
                <div class="form-group">
                    <label for="file">Archivo:</label>
                    <input type="file" id="file" name="file">
                </div>
                <button type="submit" class="send-button">Enviar</button>
            </form>

            <h2>Mensajes</h2>
            <div id="messages" class="messages-container">
                <jsp:include page="messages.jsp" />
            </div>
        </div>

        <%@include file="js-plantilla.jsp"%> 
        <%@include file="js-datatable.jsp"%> 
        <script src="js/chat.js" type="text/javascript"></script>
    </body>
</html>