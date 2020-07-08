<%-- 
    Document   : validaalterar
    Created on : 09/06/2020, 14:46:23
    Author     : Roberta
--%>

<%@page import="controler.ControlerPedido"%>
<%@page import="bean.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String cod = request.getParameter("id");
    int id = Integer.parseInt(cod);
    String bebida = request.getParameter("selectBebida");
    String almoco = request.getParameter("selectAlmoco");
    String descricao = request.getParameter("descricao");
    String paramBusca = request.getParameter("paramBusca");
    int alm = Integer.parseInt(almoco);
    int bbida = Integer.parseInt(bebida);

    Pedido pedido = new Pedido(id,alm,bbida, descricao);
    ControlerPedido cntPedido = new ControlerPedido();
    pedido = cntPedido.alteraPedido(pedido);

    String url = "validaconsultar.jsp?NOME=" + paramBusca;
    response.sendRedirect(url);
%>

