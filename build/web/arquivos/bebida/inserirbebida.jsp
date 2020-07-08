<%-- 
    Document   : inserirbebida
    Created on : 07/06/2020, 12:06:41
    Author     : Roberta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <title>Bebida</title>
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
                      <li class="tab"><a href="inserirbebida.jsp">Inserir Bebida</a></li>
                      <li class="tab"><a href="consultarbebida.jsp">Consultar Bebida</a></li>
                    </ul>
                </div>
            </nav>
        </header>
        <div class="container">
            <h1>Inserir Bebida</h1>
            <form name="inserirBebida" action="validainserir.jsp" method="post">
                Tipo Bebida: <input type="text" name="tipoBebida" value=""> <br>
                Descrição: <input type="text" name="descricao" value=""> <br>
                <input type="submit" name="Enviar" value="OK">
            </form>
        </div>
    </body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</html>
