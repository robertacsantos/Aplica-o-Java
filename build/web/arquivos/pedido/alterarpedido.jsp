<%-- 
    Document   : alterarpedido
    Created on : 09/06/2020, 14:44:00
    Author     : Roberta
--%>

<%@page import="java.util.List"%>
<%@page import="bean.Bebida"%>
<%@page import="bean.Almoco"%>
<%@page import="controler.ControlerBebida"%>
<%@page import="controler.ControlerAlmoco"%>
<%@page import="controler.ControlerPedido"%>
<%@page import="bean.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ControlerAlmoco cntAlmoco = new ControlerAlmoco();
    ControlerBebida cntBebida = new ControlerBebida();
    ControlerPedido cntPedido = new ControlerPedido();
    List<Bebida> bebidas = cntBebida.listarTodos();
    List<Almoco> almocos = cntAlmoco.listarTodos();
    String codigo = request.getParameter("id");
    int id = Integer.parseInt(codigo);
    Pedido pedido = new Pedido(id, 0, 0, "");
    pedido = cntPedido.buscaPedidoPorId(pedido);
    
    String paramBusca = request.getParameter("paramBusca");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Alterar Pedido</h1>
        <form name="alterarAlmoco" action="validaalterar.jsp" method="post">
                <%
                    Almoco alm = new Almoco(pedido.getIdAlmoco(), "", "");
                    Bebida bbida = new Bebida(pedido.getIdBebida(), "", "");
                    alm = cntAlmoco.buscaAlmocoPorId(alm);
                    bbida = cntBebida.buscaBebidaPorId(bbida);
                
                %>
                <label>Almoço</label>
                <p><%=alm.getTipoAlmoco()%></p>
                <label>Bebida</label>
                <p><%=bbida.getTipoBebida()%></p>
                <label>Almoços:</label>
                <select name="selectAlmoco">
                    <% for(Almoco almoco : almocos){%>
                        <option selected value="<%=almoco.getId()%>"><%=almoco.getTipoAlmoco()%></option>
                    <%}%>
                </select>
                <label>Bebidas:</label>
                <select name="selectBebida">
                    <% for(Bebida bebida : bebidas){%>
                        <option selected value="<%=bebida.getId()%>"><%=bebida.getTipoBebida()%></option>
                    <%}%>
                </select>
                <label> Descrição: </label>
                <input type="text" name="descricao"/>
           <input type="HIDDEN" name="id" value="<%=Integer.toString(pedido.getId())%>"> <br>
            <input type="HIDDEN" name="paramBusca" value="<%=paramBusca%>"> <br>
            <input type="submit" name="Enviar" value="OK">
        </form>
    </body>
</html>
