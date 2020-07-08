<%-- 
    Document   : login
    Created on : 07/06/2020, 00:53:53
    Author     : Roberta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <title>Login</title>
    </head>
    <body>
        <header> 
            <nav>
                <div class="nav-wrapper  red darken-4">
                    
                </div>
            </nav>
        </header>
        <div class="container">
            <h1>Seja Bem-Vindo</h1>
            <h3>Por favor, realize o seu Login.</h3>
            <form name="login" action="home.jsp" method="post">
                <label>Nome:</label>
                <input type="text" name ="nometxt"> <br>
                <label>Senha:</label>
                <input type="password" name ="senhatxt"> <br>
                <input type="submit" name="ENVIAR">
            </form> 
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </body>
</html>
