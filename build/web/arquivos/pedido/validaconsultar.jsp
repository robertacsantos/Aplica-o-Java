<%-- 
    Document   : validaconsultar
    Created on : 09/06/2020, 14:46:39
    Author     : Roberta
--%>

<%@page import="controler.ControlerAlmoco"%>
<%@page import="controler.ControlerBebida"%>
<%@page import="bean.Bebida"%>
<%@page import="bean.Almoco"%>
<%@page import="bean.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="controler.ControlerPedido"%>
<%@page import="bean.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%  
    try{
    String codigo = request.getParameter("select");
    int codigoPedido = Integer.parseInt(codigo);
    Pedido pedido = new Pedido(codigoPedido,0, 0 , "");
    ControlerPedido cntPedido = new ControlerPedido();
    ControlerBebida cntBebida = new ControlerBebida();
    ControlerAlmoco cntAlmoco = new ControlerAlmoco();
    List<Pedido> pedidos = cntPedido.listaPedido(pedido);
    Usuario usuLogado = (Usuario) session.getAttribute("Logon");
    String url = "paramBusca=" + pedido.getDescricao() +"&id=";
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
        <br>
        <div class="container">
            <h1>Pedido Consultado:</h1>
            <% 
                if (!(pedidos.isEmpty())){%>
                <tbody>
                <% 
                    for (Pedido lista : pedidos){
                        Almoco alm = new Almoco(lista.getIdAlmoco(), "", "");
                        Bebida bbida = new Bebida(lista.getIdBebida(), "", "");
                        alm = cntAlmoco.buscaAlmocoPorId(alm);
                        bbida = cntBebida.buscaBebidaPorId(bbida);
                %>
                <tr>
                    <td> <%=lista.getId()%></td>
                    <td> <%=alm.getTipoAlmoco()%></td>
                    <td> <%=bbida.getTipoBebida()%></td>
                    <td> <%=lista.getDescricao()%></td>
                    <td> <a href="excluirpedido.jsp?<%=url + lista.getId()%>">Excluir</a></td>
                    <td> <a href="alterarpedido.jsp?<%=url + lista.getId()%>">Alterar</a></td>
                </tr>
                <% } %>
            </tbody>
            <% }else{ %>
                <p>OPS!</p>
            <% }
              }catch(NumberFormatException e){ %>
                <p>Executado com Sucesso!</p>
                
                <button>
                    <a href="pedido.jsp">Voltar</a>
                </button>
            <%    } %>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </body>
</html>
