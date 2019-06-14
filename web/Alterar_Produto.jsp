<%-- 
    Document   : Alterar_Produto
    Created on : 10/06/2019, 21:52:43
    Author     : danie
--%>

<%@page import="model.UsuarioBean"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.ProdutoBean"%>
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
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    </head>
    <body>
        <nav class="light-blue lighten-1" role="navigation">
            <div class="nav-wrapper container">
                <a href="index.jsp">Bem Vindo</a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="administrativa.jsp">Voltar</a></li>
                </ul>
            </div>
        </nav>

        <div class="container">
            <div class="section">
                <!--   Icon Section   -->
                <div class="row">
                    <%
                        ProdutoDAO pdao = new ProdutoDAO();
                        List<ProdutoBean> produtos = pdao.todosProdutos();
                        for (ProdutoBean produto : produtos) {%>
                    <div class="col s3">
                        <div class="card z-depth-3">
                            <a href="ProdutoServlet?acao=Editar_Produto&id=<%=produto.getId()%>">
                                <div class="card-content">
                                    <div class="divider"></div>
                                    <img src="img/<%=produto.getImg()%>" width="200" height="200" />
                                    <h6 class="black-text"><%=produto.getNome()%></h6>
                                    <h6 class="black-text">Preço: <%= String.format("R$ %, .2f", produto.getPreco()).replace(",", ".")%></h6>
                                    <h6 class="black-text">Plataforma: <%=produto.getNome_categoria()%></h6>
                                    <h6 class="black-text">Categoria: <%=produto.getEspecificacao()%></h6>
                                    <small class="black-text">Estoque: <%=produto.getEstoque()%></small>
                                </div>
                            </a>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div><br><br>
        </div>

        <!--  Scripts-->
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="js/materialize.js"></script>
        <script src="js/init.js"></script>

    </body>
</html>