<%-- 
    Document   : excluirbebida
    Created on : 07/06/2020, 12:07:11
    Author     : Roberta
--%>

<%@page import="com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException"%>
<%@page import="controler.ControlerBebida"%>
<%@page import="bean.Bebida"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try{
        String cod = request.getParameter("id");
        int id = Integer.parseInt(cod);
        Bebida bebida = new Bebida(id,"", "");
        ControlerBebida cntBebida = new ControlerBebida();
        bebida = cntBebida.excluiBebida(bebida);
        String paramBusca = request.getParameter("paramBusca");

        // REDIRECIONA PARA A PAG LOGIN.JSP
        String url = "validaconsultar.jsp?NOME=" + paramBusca;
        response.sendRedirect(url);
    }catch(Exception e){%>
        <p>Ops! Não foi possível</p> 
    <%}%>
