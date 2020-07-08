<%-- 
    Document   : pedido
    Created on : 09/06/2020, 14:43:20
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
    ControlerPedido cntPedido = new ControlerPedido();
    ControlerAlmoco cntAlmoco = new ControlerAlmoco();
    ControlerBebida cntBebida = new ControlerBebida();
    List<Pedido> pedidos = cntPedido.listaTodos();
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <title>JSP Page</title>
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
            <h1>Pedidos</h1>
            <table border="1">
                <tr>
                    <% for(Pedido pedido : pedidos){
                        int almoco = pedido.getIdAlmoco();
                        int bebida = pedido.getIdBebida();
                        Almoco alm = new Almoco(almoco, "", "");
                        Bebida bbida = new Bebida(bebida, "", "");
                        alm = cntAlmoco.buscaAlmocoPorId(alm);
                        bbida = cntBebida.buscaBebidaPorId(bbida);
                        pedido.getDescricao();
                    %>
                    <th><%=alm.getTipoAlmoco()%></th>
                    <th><%=bbida.getTipoBebida()%></th>
                </tr>
                    <% }%>
            </table>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </body>
</html>
