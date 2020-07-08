<%-- 
    Document   : validainserir
    Created on : 09/06/2020, 14:46:55
    Author     : Roberta
--%>

<%@page import="controler.ControlerPedido"%>
<%@page import="bean.Pedido"%>
<%@page import="bean.Bebida"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
            String tipoBebida = request.getParameter("selectBebida");
            int codBebida = Integer.parseInt(tipoBebida);
            String tipoAlmoco = request.getParameter("selectAlmoco");
            int codAlmoco = Integer.parseInt(tipoAlmoco);
            String descricao = request.getParameter("descricao");
            Pedido pedido = new Pedido(0, codAlmoco, codBebida, descricao);
            ControlerPedido cntPedido = new ControlerPedido();
            pedido = cntPedido.inserirPedido(pedido);

            // REDIRECIONA PARA A PAG LOGIN.JSP
            String url = "pedido.jsp";
            response.sendRedirect(url);
            System.out.println("OLHA OLHA" + pedido.getDescricao());
%>
