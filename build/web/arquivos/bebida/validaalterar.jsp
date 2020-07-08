<%-- 
    Document   : validaalterar
    Created on : 07/06/2020, 12:08:14
    Author     : Roberta
--%>

<%@page import="controler.ControlerBebida"%>
<%@page import="bean.Bebida"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String cod = request.getParameter("id");
    int id = Integer.parseInt(cod);
    String tipoBebida = request.getParameter("tipoBebida");
    String descricao = request.getParameter("descricao");
    String paramBusca = request.getParameter("paramBusca");

    Bebida almoco = new Bebida(id,tipoBebida,descricao);
    ControlerBebida cntAlmoco = new ControlerBebida();
    almoco = cntAlmoco.alteraBebida(almoco);

    String url = "validaconsultar.jsp?NOME=" + paramBusca;
    response.sendRedirect(url);
%>
