<%-- 
    Document   : validainserir
    Created on : 07/06/2020, 12:02:50
    Author     : Roberta
--%>

<%@page import="controler.ControlerAlmoco"%>
<%@page import="bean.Almoco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String tipoAlmoco = request.getParameter("tipoAlmoco");
    String descricao = request.getParameter("descricao");
    Almoco almoco = new Almoco(0, tipoAlmoco, descricao);
    ControlerAlmoco cntAlmoco = new ControlerAlmoco();
    almoco = cntAlmoco.inserirAlmoco(almoco);

    // REDIRECIONA PARA A PAG LOGIN.JSP
    String url = "almoco.jsp";
    response.sendRedirect(url);
    System.out.println(almoco + "OLHA OLHA");
%>
