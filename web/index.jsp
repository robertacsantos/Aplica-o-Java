<%-- 
    Document   : index
    Created on : 18/06/2020, 00:24:09
    Author     : Roberta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            String url = "arquivos/acesso/login.jsp";
            response.sendRedirect(url);
        %>
    </body>
</html>
