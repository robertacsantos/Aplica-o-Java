<%-- 
    Document   : alterarbebida
    Created on : 07/06/2020, 12:07:25
    Author     : Roberta
--%>

<%@page import="controler.ControlerBebida"%>
<%@page import="bean.Bebida"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String codigo = request.getParameter("id");
    int id = Integer.parseInt(codigo);
    Bebida bebida = new Bebida(id, "", "");
    ControlerBebida cntAlmoco = new ControlerBebida();
    bebida = cntAlmoco.buscaBebidaPorId(bebida);
    String paramBusca = request.getParameter("paramBusca");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar - Bebida</title>
    </head>
    <body>
        <h1>Alterar Bebida</h1>
        <form name="alterarAlmoco" action="validaalterar.jsp" method="post">
           Tipo Almoço: <input type="text" name="tipoBebida" value="<%= bebida.getTipoBebida()%>"> <br>
           TipDescrição: <input type="text" name="descricao" value="<%= bebida.getDescricao()%>"> <br>
           <input type="HIDDEN" name="id" value="<%=Integer.toString(bebida.getId())%>"> <br>
            <input type="HIDDEN" name="paramBusca" value="<%=paramBusca%>"> <br>
            <input type="submit" name="Enviar" value="OK">
        </form>
    </body>
</html>
