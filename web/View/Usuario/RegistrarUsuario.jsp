<%-- 
    Document   : RegistrarUsuario
    Created on : 01/06/2019, 15:49:09
    Author     : danie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Center Games</title>
    </head>
    <body>
        <h1>Cadastrar Usuários</h1>
        <form name="entrada" method="post" action="UsuarioServlet">
            <input type="hidden" name="acao" value="inserir">
            Nome do Usuário: <input type="text" name="nome_usuario"><br>
            Senha: <input type="password" name="senha"><br>
            Nome: <input type="text" name="nome"><br>
            Email: <input type="text" name="email"><br>
            Admin: <input type="text" name="admin"><br>
            <input type = "submit" value = "Cadastrar">
        </form>
    </body>
</html>
