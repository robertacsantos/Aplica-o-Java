<%-- 
    Document   : consultaralmoco
    Created on : 07/06/2020, 11:59:42
    Author     : Roberta
--%>

<%@page import="bean.Almoco"%>
<%@page import="java.util.List"%>
<%@page import="controler.ControlerAlmoco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Almoco  almoco = new Almoco(0,"", "");
    System.out.println(almoco.getTipoAlmoco());
    ControlerAlmoco cntAlmoco = new ControlerAlmoco();
    List<Almoco> almocos = cntAlmoco.listarTodos();
    almocos.add(almoco);
       
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <title>Consulta - Almoço</title>
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
            <h1>Consulta Almoço</h1>
            <form name="consultarAlmoco" action="validaconsultar.jsp" method="post">
               <select name="select" class="browser-default">
                    <% for (Almoco alm : almocos) { %>
                        <option selected value="<%=alm.getId()%>"><%=alm.getTipoAlmoco()%></option>
                    <% } %>
                </select>

               <input type="submit" name ="Enviar" value="Enviar"> 
            </form>
        </div>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </body>
</html>
