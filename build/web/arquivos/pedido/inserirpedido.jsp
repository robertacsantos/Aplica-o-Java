<%-- 
    Document   : inserirpedido
    Created on : 09/06/2020, 14:45:44
    Author     : Roberta
--%>

<%@page import="bean.Almoco"%>
<%@page import="controler.ControlerAlmoco"%>
<%@page import="bean.Bebida"%>
<%@page import="java.util.List"%>
<%@page import="controler.ControlerBebida"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ControlerBebida cntBebida = new ControlerBebida();
    List<Bebida> listaBebida = cntBebida.listarTodos();
    
    ControlerAlmoco cntAlmoco = new ControlerAlmoco();
    List<Almoco> listaAlmoco = cntAlmoco.listarTodos();

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
                <form action="validainserir.jsp" method="post" name="formPedido">
                    <label>Almoços:</label>
                    <select class="browser-default" name="selectAlmoco">
                        <% for(Almoco almoco : listaAlmoco){%>
                            <option selected value="<%=almoco.getId()%>"><%=almoco.getTipoAlmoco()%></option>
                        <%}%>
                    </select>
                    <label>Bebidas:</label>
                    <select class="browser-default" name="selectBebida">
                        <% for(Bebida bebida : listaBebida){%>
                            <option selected value="<%=bebida.getId()%>"><%=bebida.getTipoBebida()%></option>
                        <%}%>
                    </select>
                    <label>Descricao</label>
                    <input type="text" name="descricao"/>
                    <input type="submit" value="Ok" />
                </form> 
            </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </body>
</html>
