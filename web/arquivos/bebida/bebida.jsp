<%-- 
    Document   : bebida
    Created on : 07/06/2020, 12:05:05
    Author     : Roberta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bean.Bebida"%>
<%@page import="controler.ControlerBebida"%>
<%@page import="java.util.List"%>



<%
    ControlerBebida ctnPedido = new ControlerBebida();
    List<Bebida> bebidas = ctnPedido.listarTodos();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <title>Bebidas</title>
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
                      <li class="tab"><a href="inserirbebida.jsp">Inserir Bebidas</a></li>
                      <li class="tab"><a href="consultarbebida.jsp">Consultar Bebidas</a></li>
                    </ul>
                </div>
            </nav>
        </header>
        <div class="container">
            <h1>Bebidas</h1>
             <table border="1">
                <% for (Bebida beb : bebidas) { %>
                    <tr>	
                        <td><%=beb.getTipoBebida() %></td>
                        <td><%=beb.getDescricao() %></td>
                    </tr> 
                <% } %>
            </table>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </body>
</html>
