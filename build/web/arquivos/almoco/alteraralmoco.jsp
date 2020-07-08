<%-- 
    Document   : alteraralmoco
    Created on : 07/06/2020, 11:59:54
    Author     : Roberta
--%>

<%@page import="controler.ControlerAlmoco"%>
<%@page import="bean.Almoco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String codigo = request.getParameter("id");
    int id = Integer.parseInt(codigo);
    Almoco almoco = new Almoco(id, "", "");
    ControlerAlmoco cntAlmoco = new ControlerAlmoco();
    almoco = cntAlmoco.buscaAlmocoPorId(almoco);
    String paramBusca = request.getParameter("paramBusca");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <title>Alterar - Almoço</title>
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
            <h1>Alterar Almoço</h1>
            <form name="alterarAlmoco" action="validaalterar.jsp" method="post">
               Tipo Almoço: <input type="text" name="tipoAlmoco" value="<%= almoco.getTipoAlmoco()%>"> <br>
               TipDescrição: <input type="text" name="descricao" value="<%= almoco.getDescricao()%>"> <br>
               <input type="HIDDEN" name="id" value="<%=Integer.toString(almoco.getId())%>"> <br>
                <input type="HIDDEN" name="paramBusca" value="<%=paramBusca%>"> <br>
                <input type="submit" name="Enviar" value="OK">
            </form>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </body>
</html>
