<%-- 
    Document   : index
    Created on : 05/06/2019, 08:34:20
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
                        <%
                            if (session.getAttribute("usuario") != null) {
                                UsuarioBean usuario = new UsuarioBean();
                                usuario = (UsuarioBean) session.getAttribute("usuario");
                        %>
                    <li><a href="Altera_User.jsp"><%=usuario.getNome_usuario()%></a></li>
                    <li><a href="UsuarioServlet?acao=sair">Sair</a></li>
                        <%
                            if (usuario.getAdmin()) {
                        %>
                    <li><a href="administrativa.jsp">Área administrativa</a></li>
                        <%
                                }
                            }else{
                        %>
                    <li><a href="Logar.jsp">Login</a></li>
                    <%
                        }
                    %>
                    <li><a href="carrinho.jsp"> <i class="material-icons">add_shopping_cart</i></a></li>
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
                            <a href="ProdutoServlet?acao=verProduto&id=<%=produto.getId()%>">
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

        <footer class="page-footer light-blue lighten-1">
            <div class="container">
                <div class="row">
                    <div class="col l6 s12">
                        <h5 class="white-text">Center Games</h5>
                        <p class="grey-text text-lighten-4"></p>


                    </div>
                    <div class="col l3 s12">
                        <h5 class="white-text">Settings</h5>
                        <ul>
                            <li><a class="white-text" href="#!">Link 1</a></li>
                            <li><a class="white-text" href="#!">Link 2</a></li>
                            <li><a class="white-text" href="#!">Link 3</a></li>
                            <li><a class="white-text" href="#!">Link 4</a></li>
                        </ul>
                    </div>
                    <div class="col l3 s12">
                        <h5 class="white-text">Connect</h5>
                        <ul>
                            <li><a class="white-text" href="#!">Link 1</a></li>
                            <li><a class="white-text" href="#!">Link 2</a></li>
                            <li><a class="white-text" href="#!">Link 3</a></li>
                            <li><a class="white-text" href="#!">Link 4</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="footer-copyright">
                <div class="container">
                    Made by <p>Daniel Rocha Limana & Matheus dos Santos Garcez</p>
                </div>
            </div>
        </footer>


        <!--  Scripts-->
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="js/materialize.js"></script>
        <script src="js/init.js"></script>

    </body>
</html>