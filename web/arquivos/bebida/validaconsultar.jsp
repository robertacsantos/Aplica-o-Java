<%-- 
    Document   : validaconsultar
    Created on : 07/06/2020, 12:08:35
    Author     : Roberta
--%>

<%@page import="bean.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="controler.ControlerBebida"%>
<%@page import="bean.Bebida"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
    try{
    String codigo = request.getParameter("select");
    int codigoBebida = Integer.parseInt(codigo);
    Bebida bebida = new Bebida(codigoBebida,"", "");
    ControlerBebida cntBebida = new ControlerBebida();
    List<Bebida> bebidas = cntBebida.listaBebida(bebida);
    Usuario usuLogado = (Usuario) session.getAttribute("Logon");
    String url = "paramBusca=" + bebida.getTipoBebida() +"&id=";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bebida</title>
    </head>
    <body>
        <table>
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Tipo Bebida</th>
                    <th>Excluir</th>
                    <th>Alterar</th>
                </tr>
            </thead>
            <% 
                if (!(bebidas.isEmpty())){%>
                <tbody>
                    <% 
                        for (Bebida listaBebidas : bebidas){
                            System.out.println("Listaaaa" + listaBebidas.getTipoBebida());
                    %>
                    <tr>
                        <td> <%=listaBebidas.getId()%></td>
                        <td> <%=listaBebidas.getTipoBebida()%></td>
                        <td> <%=listaBebidas.getDescricao()%></td>
                        <td> <a href="excluirbebida.jsp?<%=url + listaBebidas.getId()%>">Excluir</a></td>
                        <td> <a href="alterarbebida.jsp?<%=url + listaBebidas.getId()%>">Alterar</a></td>
                    </tr>
                    <% } %>
                </tbody>
            <% }else{ %>
                <p>OPS!</p>
            <% }
              }catch(NumberFormatException e){ %>
                <p>Executado com Sucesso!</p>
                
                <button>
                    <a href="bebida.jsp">Voltar</a>
                </button>
            <%    } %>
            
            
            
        </table>
    </body>
</html>
