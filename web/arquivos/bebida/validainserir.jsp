<%-- 
    Document   : validainserir
    Created on : 07/06/2020, 12:07:59
    Author     : Roberta
--%>

<%@page import="controler.ControlerBebida"%>
<%@page import="bean.Bebida"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <%
            String tipoBebida = request.getParameter("tipoBebida");
            String descricao = request.getParameter("descricao");
            Bebida bebida = new Bebida(0, tipoBebida, descricao);
            ControlerBebida cntBebida = new ControlerBebida();
            bebida = cntBebida.inserirBebida(bebida);

            // REDIRECIONA PARA A PAG LOGIN.JSP
            String url = "bebida.jsp";
            response.sendRedirect(url);
            System.out.println("OLHA OLHA" + bebida);
%>
    