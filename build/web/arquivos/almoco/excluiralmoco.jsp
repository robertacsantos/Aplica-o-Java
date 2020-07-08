<%-- 
    Document   : excluiralmoco
    Created on : 07/06/2020, 12:00:06
    Author     : Roberta
--%>

<%@page import="controler.ControlerAlmoco"%>
<%@page import="bean.Almoco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try{
        String cod = request.getParameter("id");
        int id = Integer.parseInt(cod);
        Almoco almoco = new Almoco(id,"", "");
        ControlerAlmoco cntAlmoco = new ControlerAlmoco();
        almoco = cntAlmoco.excluiAlmoco(almoco);
        String paramBusca = request.getParameter("paramBusca");

        // REDIRECIONA PARA A PAG LOGIN.JSP
        String url = "validaconsultar.jsp?NOME=" + paramBusca;
        response.sendRedirect(url);
    }catch(Exception e){%>
    <p>Ops! Não é possível excluir!</p> 
    <%}
%>
