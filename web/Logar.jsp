<%-- 
    Document   : Logar
    Created on : 05/06/2019, 14:56:31
    Author     : danie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>Center Games</title>
        <!-- CSS  -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="css/materialize.css" type="text/css" rel="stylesheet"/>
        <link href="css/style.css" type="text/css" rel="stylesheet"/>
        <link href="js/materialize.js" type="text/javascript" rel="stylesheet"/>
    </head>
    <body>
        <nav class="light-blue lighten-1" role="navigation">
            <div class="nav-wrapper container"><a href="index.jsp">Bem Vindo</a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="Logar.html">Login</a></li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <div class="section">
                <!--   Icon Section   -->
                <div class="row">
                     <div class="col s12 m4">
                    <div class="icon-block">
                    </div>
                </div>
                    <form method="post" class="col s12 m4" action="UsuarioServlet?acao=logar">
                        <h4>Login:</h4>
                        <div class="row">
                            <div class="input-field col s12">
                                <input name="nome_usuario" type="text" class="validate">
                                <label for="nome_usuario">User</label>
                            </div>
                            <div class="input-field col s12">
                                <input name="senha" type="password" class="validate">
                                <label for="senha">Password</label>
                            </div>
                            <input type="submit" value="Logar">
                        </div>
                    </form>
                </div>
            </div><br><br>
        </div>
    </body>
    
</html>
