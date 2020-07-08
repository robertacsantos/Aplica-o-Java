<%-- 
    Document   : validaalterar
    Created on : 07/06/2020, 12:01:58
    Author     : Roberta
--%>

<%@page import="controler.ControlerAlmoco"%>
<%@page import="bean.Almoco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String cod = request.getParameter("id");
    int id = Integer.parseInt(cod);
    String tipoAlmoco = request.getParameter("tipoAlmoco");
    String descricao = request.getParameter("descricao");
    String paramBusca = request.getParameter("paramBusca");

    Almoco almoco = new Almoco(id,tipoAlmoco,descricao);
    ControlerAlmoco cntAlmoco = new ControlerAlmoco();
    almoco = cntAlmoco.alteraAlmoco(almoco);
    // REDIRECIONA PARA A PAG LOGIN.JSP
    String url = "validaconsultar.jsp?NOME=" + paramBusca;
    response.sendRedirect(url);
%>
