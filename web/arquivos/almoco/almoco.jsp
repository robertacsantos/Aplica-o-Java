<%-- 
    Document   : almoco
    Created on : 07/06/2020, 11:53:47
    Author     : Roberta
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="controler.ControlerAlmoco"%>
<%@page import="bean.Almoco"%>

<%
    ControlerAlmoco ctnAlmoco = new ControlerAlmoco();
    List<Almoco> almocos = ctnAlmoco.listarTodos();
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Almoços</title>
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
                      <li class="tab"><a href="inseriralmoco.jsp">Inserir Almoco</a></li>
                      <li class="tab"><a href="consultaralmoco.jsp">Consultar Almoco</a></li>
                    </ul>
                </div>
            </nav>
        </header>
        <div class="container">
            <h1>Almoços</h1>
        
            <br>
            <table border="1">

                <% for (Almoco alm : almocos) { %>
                    <tr>	
                        <td><%=alm.getTipoAlmoco() %></td>
                        <td><%=alm.getDescricao() %></td>
                    </tr> 
                <% } %>
            </table>
            
        </div>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </body>
</html>
