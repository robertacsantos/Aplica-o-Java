<%-- 
    Document   : validaconsultar
    Created on : 07/06/2020, 12:02:19
    Author     : Roberta
--%>

<%@page import="bean.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="controler.ControlerAlmoco"%>
<%@page import="bean.Almoco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
    try{
    String codigo = request.getParameter("select");
    int codigoAlmoco = Integer.parseInt(codigo);
    Almoco almoco = new Almoco(codigoAlmoco,"", "");
    ControlerAlmoco cntAlmoco = new ControlerAlmoco();
    List<Almoco> almocos = cntAlmoco.listaAlmoco(almoco);
    Usuario usuLogado = (Usuario) session.getAttribute("Logon");
    String url = "paramBusca=" + almoco.getTipoAlmoco() +"&id=";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <title>Consultar</title>
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
            <h1>Valida Consultar:</h1>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tipo Almoço</th>
                        <th>Descrição</th>
                        <th>Excluir</th>
                        <th>Alterar</th>
                    </tr>
                </thead>
                <% 
                    if (!(almocos.isEmpty())){%>
                    <tbody>
                        <% 
                            for (Almoco listaAlmoco : almocos){
                        %>
                        <tr>
                            <td> <%=listaAlmoco.getId()%></td>
                            <td> <%=listaAlmoco.getTipoAlmoco()%></td>
                            <td> <%=listaAlmoco.getDescricao()%></td>
                            <td> <a href="excluiralmoco.jsp?<%=url + listaAlmoco.getId()%>">Excluir</a></td>
                            <td> <a href="alteraralmoco.jsp?<%=url + listaAlmoco.getId()%>">Alterar</a></td>
                        </tr>
                        <% } %>
                    </tbody>
                <% }else{ %>
                    <p>OPS!</p>
                <% } %>
            </table>
        </div>
            
        <% }catch(NumberFormatException e){ %>
            <head>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
            </head> 
          <div class="container">
              <h5>Executado com Sucesso!</h5>
              <button>
                  <a href="almoco.jsp">Voltar</a>
              </button>
          </div>
          <%    } %> 
            
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </body>
</html>
