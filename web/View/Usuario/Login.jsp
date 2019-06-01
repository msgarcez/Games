<%-- 
    Document   : Login
    Created on : 01/06/2019, 15:46:38
    Author     : danie
--%>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html id="html">
          <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="css/estilo.css">
    <title> Loja de Livros</title>
    </head>
    <body>

    <div id="main">
    <div id="header">
                <div id="widgetBar">
                 
                </div>

                <a href="index.jsp">
                    <img src="img/logo.png"  id="logo" alt="Loja de Livro logo">
                </a>
               <a href="index.jsp">
                <img src="img/textologo.png" id="logoText" alt="loja  de livros">
               </a>
            </div>
         <h3>Fazer Login:</h3>
     <form action="../../ClienteServlet" method="post">
            <input type="hidden" name="acao" value="login" />
        <p><strong>Login: </strong>
            <input type="text" size="20" name="login"></p>

        <p><strong>Senha: </strong>
            <input type="password" size="20" name="senha"></p>

        <p><input id="already-user-submit" type="submit" value="Entrar"></p>
    </div>
           <a href="View/Cliente/RegistrarCliente.jsp"> Cadastrar Novo Usuário</a><br>
           <br>
       </form>
  
          
                      
        
        <div id="footer">
                <hr>
                <p id="footerText"> Site criado em Junho de 2019 por Daniel e Matheus - Copyright © 2019.</p>
            </div>
    </div>
        
        
    </body>
</html>