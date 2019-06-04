<%-- 
    Document   : Cadastro_User
    Created on : 01/06/2019, 18:08:46
    Author     : danie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Center Game</title>
    </head>
    <body>
        <h1>Cadastrar Clientes</h1>
        <form method="post" action="UsuarioServlet?acao=inserir">
        Nome do Usuário: <input type="text" name="nome_usuario"><br>
        Senha: <input type="text" name="senha"><br>
        Nome: <input type="text" name="nome"><br>
        Email: <input type="text" name="email"><br>
        <input type = "submit" value = "Salvar">
        </form>
    </body>
</html>
