<%-- 
    Document   : Cadastro_Produto
    Created on : 04/06/2019, 22:13:18
    Author     : danie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Cadastro Produto</h1>
        <form method="post" action="ProdutoServlet?acao=produto">
            Nome: <input type="text" name="nome"><br><br>
            Preço: <input type="text" name="preco"><br><br>
            Categoria: <input type="text" name="categoria"><br><br>
            Especificação: <input type="text" name="especificacao"><br><br>
            Estoque: <input type="text" name="estoque"><br><br>
            <input type="submit" value="Cadastrar">
        </form>
    </body>
</html>
    