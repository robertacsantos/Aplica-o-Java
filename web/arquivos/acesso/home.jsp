<%-- 
    Document   : home
    Created on : 07/06/2020, 00:58:06
    Author     : Roberta
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controler.ControlerUsuario"%>
<%@page import="bean.Usuario"%>

<%
//    String url = "../almoco/almoco.jsp";
//    System.out.println("opssss");
//    response.sendRedirect(url);

try{
    String nome = request.getParameter("nometxt");
    String senha = request.getParameter("senhatxt");
    Usuario user = new Usuario(0, nome, senha, "");
    ControlerUsuario cntUsuario = new ControlerUsuario();
    user = cntUsuario.validaUsuario(user);
    
    if (user.getStatus().equals("ADM")){
        session.setAttribute("Logon", user);
        response.sendRedirect("../almoco/almoco.jsp");
    }
    else if(user.getStatus().equals("COMUM")){
        session.setAttribute("Logon", user.getStatus());
        response.sendRedirect("../pedido/pedido.jsp");
    }else{
        session.setAttribute("Logoff", user);
        response.sendRedirect("login.jsp");      
    }
    
    }catch(Exception e){
        String url = "../almoco/almoco.jsp";
        System.out.println("opssss");
        response.sendRedirect(url);
    }
    
%>


