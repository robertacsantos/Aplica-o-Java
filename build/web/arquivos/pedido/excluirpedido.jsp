<%-- 
    Document   : excluirpedido
    Created on : 09/06/2020, 14:44:40
    Author     : Roberta
--%>

<%@page import="controler.ControlerPedido"%>
<%@page import="bean.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try{
        String cod = request.getParameter("id");
        int id = Integer.parseInt(cod);
        Pedido bebida = new Pedido(id,0, 0, "");
        ControlerPedido cntBebida = new ControlerPedido();
        bebida = cntBebida.excluiPedido(bebida);
        String paramBusca = request.getParameter("paramBusca");

        // REDIRECIONA PARA A PAG LOGIN.JSP
        String url = "validaconsultar.jsp?NOME=" + paramBusca;
        response.sendRedirect(url);
    }catch(Exception e){%>
        <p>Ops! Não foi possível</p> 
    <%}%>
