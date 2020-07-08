<%-- 
    Document   : consultarpedido
    Created on : 09/06/2020, 14:44:14
    Author     : Roberta
--%>

<%@page import="controler.ControlerBebida"%>
<%@page import="controler.ControlerAlmoco"%>
<%@page import="bean.Bebida"%>
<%@page import="bean.Almoco"%>
<%@page import="bean.Pedido"%>
<%@page import="java.util.List"%>
<%@page import="controler.ControlerPedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ControlerAlmoco cntAlmoco = new ControlerAlmoco();
    ControlerBebida cntBebida = new ControlerBebida();
    ControlerPedido cntPedido = new ControlerPedido();
    List<Pedido> bebidas = cntPedido.listaTodos();

       
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pedido</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    </head>
    <body>
        <header> 
            <nav>
                <div class="nav-wrapper  red darken-4">
                    <ul id="nav-mobile" class="left hide-on-med-and-down">
                      <li><a href="../almoco/almoco.jsp">Almoços</a></li>
                      <li><a href="../bebida/bebida.jsp">Bebidas</a></li>
                      <li><a href="../pedido/pedido.jsp">Pedidos</a></li>
                    </ul>
                </div>
                <div class="nav-content  red darken-4">
                    <ul class="tabs tabs-transparent">
                      <li class="tab"><a href="inserirpedido.jsp">Inserir Pedido</a></li>
                      <li class="tab"><a href="consultarpedido.jsp">Consultar Pedido</a></li>
                    </ul>
                </div>
            </nav>
        </header>
        <div class="container">
            <h1>Consulta Pedido</h1>
            <form name="consultarBebida" action="validaconsultar.jsp" method="post">
               <select name="select" class="browser-default">
                    <% for (Pedido ped : bebidas) { 
                        Almoco alm = new Almoco(ped.getIdAlmoco(), "", "");
                        Bebida bbida = new Bebida(ped.getIdBebida(), "", "");
                        alm = cntAlmoco.buscaAlmocoPorId(alm);
                        bbida = cntBebida.buscaBebidaPorId(bbida);

                    %>

                        <option selected value="<%=ped.getId()%>"><%=alm.getTipoAlmoco()+ " + " + bbida.getTipoBebida()%></option>
                    <% } %>
                </select>

               <input type="submit" name ="Enviar" value="Enviar"> 
           </form>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </body>
</html>
